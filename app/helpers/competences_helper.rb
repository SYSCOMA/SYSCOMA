module CompetencesHelper
  def collection_for_select_value ability
    values = ability.values.to_a
    values.concat ability.competence_matrix.values.to_a
    values.sort_by! { |value| value.rank }
  end
end
