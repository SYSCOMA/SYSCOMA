class SearchCriteria < ActiveRecord::Base
  validates :name, presence: true, 
      length: { minimum: 2 }, 
      uniqueness: true
  validates :composition, presence: true

  has_many :criteria, dependent: :destroy
  belongs_to :scope, class_name: 'Group'
  belongs_to :user

  def formula
    if composition.present?
      process_search_criteria composition
    else
      ""
    end
  end

  private
    def process_search_criteria element
      elements = split_closure element
      if elements.one?
        criterium = elements.first
        criterium = criterium[1..-2].split ":"
        if criterium.one? #first case
          " (#{SearchCriteria.find(criterium.first.to_i).name})"
        else #second case
          process_criterium criterium
        end
      else # elements.second == "AND" || elements.second == "OR" #third case
        " (" + process_search_criteria(elements.first) + " " + elements.second + " " +  process_search_criteria(elements.last) + ")"
      end
    end

    # split into smaller elements, delimited by "(" and ")"
    def split_closure element
      open = -1
      elements=[]
      element.each_char.with_index do |char, i|
        if char=="("
          open += 1
        elsif char==")"
          open -= 1
          if open == -1 #this happens when the element is unique
            elements = [element]
            break
          elsif open == 0
            if element[(i+1)..(i+2)]=="OR"
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
    def process_criterium split
      knowledge_area = KnowledgeArea.find(split.first)
      ability = Ability.find(split.second)
      competence_matrix = knowledge_area.competence_matrix
      value = Value.find_by(rank: split.fourth, competence_matrix_id: competence_matrix.id)
      if value.nil?
        value = Value.find_by(rank: split.fourth, ability_id: ability.id)
      end
      " (#{competence_matrix.name}:#{knowledge_area.name}:#{ability.name}:#{split.third}:#{value.value})"
    end
end
