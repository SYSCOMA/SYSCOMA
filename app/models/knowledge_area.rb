class KnowledgeArea < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 1 }
  belongs_to :competence_matrix
end
