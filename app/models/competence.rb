class Competence < ActiveRecord::Base
  belongs_to :criterion
  belongs_to :user
  belongs_to :knowledge_area
  belongs_to :ability
  belongs_to :value

  def competence_matrix_id
    ability.competence_matrix_id
  end

  def competence_matrix
    ability.competence_matrix
  end
end
