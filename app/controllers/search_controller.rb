class SearchController < ApplicationController
  before_action :authenticate_user!

  def new
    @saved_searchs = SearchCriteria.all
    @search_criteria = SearchCriteria.new
    @search_criteria.criteria.build
    set_scope_array
  end

  def criteria
    if params[:commit] == "Search"
      search
    else
      @search_criteria = SearchCriteria.new(params.require(:search_criteria).permit(:scope_id,:composition, :name))
      @save = params[:save]
      if params[:competence_matrix_id].present?
        @competence_matrix = CompetenceMatrix.find params[:competence_matrix_id]
      else
        @competence_matrices = CompetenceMatrix.all
      end
      if params[:knowledge_area_id].present?
        @knowledge_area = KnowledgeArea.find params[:knowledge_area_id]
      end
      if params[:ability_id].present?
        @ability = Ability.find params[:ability_id]
        @values = @ability.competence_matrix.values.to_a.concat @ability.values.to_a
      end
      if params[:sign].present?
        @sign = params[:sign]
      end
      if params[:conective].present?
        @conective = params[:conective]
      end
      if params[:value_id].present?
        @value = Value.find params[:value_id]
        add_composition
      end
      if @competence_matrix.present?
        @knowledge_areas = @competence_matrix.knowledge_areas
        @abilities = [Ability.new({id: 0, name: 'ALL'})].concat @competence_matrix.abilities
      end
    end
  end

  def saved
    @search_criteria = SearchCriteria.find params.require(:search_criteria)[:id]
    @users = process_search_criteria @search_criteria.composition
    render 'search'
  end

  private
    def search
      @search_criteria = SearchCriteria.new(params.require(:search_criteria).permit(:scope_id, :name, :composition))
      if params[:save]
        @search_criteria.save
      end
      @users = process_search_criteria @search_criteria.composition
      if @search_criteria.scope.present?
        @users.select do |user| 
          user.group == @search_criteria || user.group.subordinate?(@search_criteria.scope)
        end
      end
      render 'search'
    end

    def add_composition
      element = "#{@competence_matrix.name}:#{@knowledge_area.name}:#{@ability.name}:#{@sign}:#{@value.rank}"
      if @conective.nil?
        add_element element
      else
        add_element element, @conective
      end
      @competence_matrix = nil
      @knowledge_area = nil
      @ability = nil
      @sign = nil
      @value = nil
      @conective = nil
      @competence_matrices = CompetenceMatrix.all
    end

    def add_element element, conective=nil
      @search_criteria.composition ||= ""
      @search_criteria.composition = @search_criteria.composition.prepend "("
      if conective.present?
        @search_criteria.composition = @search_criteria.composition.concat conective
        @search_criteria.composition = @search_criteria.composition.concat "("
      end
      @search_criteria.composition = @search_criteria.composition.concat element
      @search_criteria.composition = @search_criteria.composition.concat ")"
      if conective.present?
        @search_criteria.composition = @search_criteria.composition.concat ")"
      end
    end

    def set_scope_array
      # For now an user can search in his group, in de groups directly above and in the groups below
      @scope_array = []
      group = current_user.group
      if group.present?
        @scope_array = group.superior_groups.concat group.subordinated_groups
      end
    end

    def process_search_criteria element
      elements = split_closure element
      if elements.one?
        process_criterion elements.first
      elsif elements.second == "AND"
        AND process_search_criteria(elements.first), process_search_criteria(elements.last)
      elsif elements.second == "OR"
        OR process_search_criteria(elements.first), process_search_criteria(elements.last)
      else 
        #syntax error
        raise elements.inspect
      end
    end

    def AND result1, result2
      result1.select { |user| result2.include? user }
    end

    def OR result1, result2
      result1.concat result2
      result1.uniq
    end

    def split_closure element
      elements = []
      if element.first == "("
        open = 0
        element.each_char.with_index do |char, i|
          if char=="("
            open += 1
          elsif char==")"
            open -= 1
            if open == 0
              if i == element.size-1
                elements = [element]
              elsif element[(i+1)..(i+2)]=="OR"
                elements = [element[0..i], "OR", element[(i+3)..-1]]
              elsif element[(i+1)..(i+3)]=="AND"
                elements = [element[0..i], "AND", element[(i+4)..-1]]
              else
                #syntax error
              end
              break
            end
          end
        end
      end
      elements
    end

    def process_criterion criterion
      criterion = criterion[1..-2]
      split = criterion.split ":"
      competence_matrix = CompetenceMatrix.find_by(name: split.first)
      knowledge_area = KnowledgeArea.find_by(name: split.second,
          competence_matrix_id: competence_matrix.id)
      if split.third=="ALL"
        abilities = Ability.where(competence_matrix_id: competence_matrix.id)
      else
        abilities = [Ability.find_by(name: split.third, competence_matrix_id: competence_matrix.id)]
      end
      competences_result = []
      abilities.each do |ability|
        case split.fourth
          when "<" then competences_result.concat Competence.joins(:value).
              where("knowledge_area_id = ? AND competences.ability_id = ? AND rank < ?",
              knowledge_area.id, ability.id, split.fifth)
          when ">" then competences_result.concat Competence.joins(:value).
              where("knowledge_area_id = ? AND competences.ability_id = ? AND rank > ?",
              knowledge_area.id, ability.id, split.fifth)
          when "<=" then competences_result.concat Competence.joins(:value).
              where("knowledge_area_id = ? AND competences.ability_id = ? AND rank <= ?",
              knowledge_area.id, ability.id, split.fifth)
          when ">=" then competences_result.concat Competence.joins(:value).
              where("knowledge_area_id = ? AND competences.ability_id = ? AND rank >= ?",
              knowledge_area.id, ability.id, split.fifth)
          when "=" then competences_result.concat Competence.joins(:value).
              where("knowledge_area_id = ? AND competences.ability_id = ? AND rank = ?",
              knowledge_area.id, ability.id, split.fifth)
        end
      end
      result = competences_result.collect { |competence| competence.user }
      result.uniq
    end
end
