module UsersHelper
  def editor? user
    current_user == user || current_user.admin? || user.subordinate?(current_user)
  end

  def values_for_knowledge_area knowledge_area, competences, abilities
    competences_copy = competences.clone
    competences_copy.select! { |competence| competence.knowledge_area_id == knowledge_area.id }
    competences_copy = fill_competences competences_copy, abilities.clone
    competences_copy.sort_by! { |competence| competence.ability.name }
    competences_copy.collect { |competence| competence.value.value }
  end

  private
    def fill_competences competences, abilities
      filled_abilities = (competences.collect { |competence| competence.ability }).
          sort_by { |ability| ability.name }
      abilities.select! { |ability| filled_abilities.exclude? ability }

      value = Value.new value: "None"
      empty_competences = abilities.collect { |ability| Competence.
          new(ability: ability, value: value) }
      competences.concat empty_competences
    end
end
