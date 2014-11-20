class SearchController < ApplicationController
  before_action :authenticate_user!
  before_action :set_saved_searches
  before_action :set_scope_array
  before_action :set_search_criteria, except: [:new]

  def new
    if params.key? :search_criteria
      set_search_criteria
    else
      @search_criteria = SearchCriteria.new
    end
    @competence_matrices = CompetenceMatrix.all
    render 'competence_matrix_step'
  end

  def knowledge_area_ability_and_operator_step
    @competence_matrix = CompetenceMatrix.find(params[:competence_matrix_id])
    @conective = params[:conective]
    @knowledge_areas = @competence_matrix.knowledge_areas
    @abilities = @competence_matrix.abilities
    @conective = params[:conective]
  end

  def value_step
    @competence_matrix = CompetenceMatrix.find(params[:competence_matrix_id])
    @conective = params[:conective]
    @knowledge_area = KnowledgeArea.find(params[:knowledge_area_id])
    @ability = Ability.find(params[:ability_id])
    @sign = params[:sign]
    @conective = params[:conective]
    @values = @ability.competence_matrix.values.to_a.concat @ability.values.to_a
  end

  def add_element
    @competence_matrices = CompetenceMatrix.all
    element = "(#{params[:knowledge_area_id]}:#{params[:ability_id]}:#{params[:sign]}:#{params[:value_rank]})"
    add_criterion element, params[:conective]
    render 'competence_matrix_step'
  end

  def add_saved
    @competence_matrices = CompetenceMatrix.all
    saved_id = params.require(:saved_id)
    if params[:commit] == t('searches.see', default: "See")
      @saved_search = SearchCriteria.find(saved_id)
    elsif params[:commit] == t('helpers.links.destroy', default: "Delete")
      saved_search = SearchCriteria.find(saved_id)
      saved_search.destroy
    else # Add
      element = "(#{saved_id})"
      add_criterion element, params[:conective]
    end
    render 'competence_matrix_step'
  end

  def save
    @competence_matrices = CompetenceMatrix.all
    @search_criteria.user = current_user
    @search_criteria.save
    render 'competence_matrix_step'
  end

  private
    def set_saved_searches
      @saved_searches = SearchCriteria.where(user_id: current_user.id)
    end

    def set_scope_array
      # For now an user can search in his group, in de groups directly above and in the groups below
      @scope_array = []
      group = current_user.group
      if group.present?
        @scope_array = group.superior_groups + [group] + group.subordinated_groups
      end
    end

    def set_search_criteria
      @search_criteria = SearchCriteria.new(params.require(:search_criteria).permit(:id, :scope_id,:composition, :name))
    end

    def add_criterion element, conective=nil
      @search_criteria.composition ||= ""
      if conective.present?
        @search_criteria.composition = @search_criteria.composition.prepend "("
        @search_criteria.composition = @search_criteria.composition.concat conective
      end
      @search_criteria.composition = @search_criteria.composition.concat element
      if conective.present?
        @search_criteria.composition = @search_criteria.composition.concat ")"
      end
    end

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

    # Element is in one of the following formats:
    # (saved_seach_id)
    # (knowledge_area_id:knowledge_area_id:ability_id:comparator:value_rank)
    # ((#{element})AND(#{element}))
    # ((#{element})OR(#{element}))
    def process_search_criteria element
      elements = split_closure element
      if elements.one?
        criterion = elements.first
        criterion = criterion[1..-2]
        split = criterion.split ":"
        if split.one? #first case
          process_search_criteria SearchCriteria.find(split.first.to_i).composition
        else #second case
          process_criterion split
        end
      elsif elements.second == "AND" #third case
        process_search_criteria(elements.first) & process_search_criteria(elements.last)
      else # elements.second == "OR" #fourth case
        result = process_search_criteria(elements.first) + process_search_criteria(elements.last)
        result.uniq
      end
    end

    # separate into smaller elements, delimited by "(" and ")"
    def split_closure element
      open = -1
      element.each_char.with_index do |char, i|
        if char=="("
          open += 1
        elsif char==")"
          open -= 1
          if open == 0
            if i == element.size-1
              elements = [element]
            elsif element[(i+1)..(i+2)]=="OR"
              elements = [element[1..i], "OR", element[(i+3)..-2]]
            else # element[(i+1)..(i+3)]=="and"
              elements = [element[1..i], "AND", element[(i+4)..-2]]
            end
            break
          end
        end
      end
      elements
    end

    #do the query
    def process_criterion split
      case split.third
      when "<" then competences_result = Competence.joins(:value).
        where("knowledge_area_id = ? AND competences.ability_id = ? AND rank < ?",
        split.first, aplit.second, split.fourth)
      when ">" then competences_result = Competence.joins(:value).
        where("knowledge_area_id = ? AND competences.ability_id = ? AND rank > ?",
        split.first, aplit.second, split.fourth)
      when "<=" then competences_result = Competence.joins(:value).
        where("knowledge_area_id = ? AND competences.ability_id = ? AND rank <= ?",
        split.first, aplit.second, split.fourth)
      when ">=" then competences_result = Competence.joins(:value).
        where("knowledge_area_id = ? AND competences.ability_id = ? AND rank >= ?",
        split.first, aplit.second, split.fourth)
      when "=" then competences_result = Competence.joins(:value).
        where("knowledge_area_id = ? AND competences.ability_id = ? AND rank = ?",
        split.first, aplit.second, split.fourth)
      end
      result = competences_result.collect { |competence| competence.user }
      result.uniq
    end
end
