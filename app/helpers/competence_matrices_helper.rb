module CompetenceMatricesHelper

  def addAbility competence_matrix
    competence_matrix.abilities.build
  end
end
