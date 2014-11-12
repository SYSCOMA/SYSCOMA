class KnowledgeArea < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 1 },
      uniqueness: { scope: :competence_matrix }
  belongs_to :competence_matrix
  has_many :competences, dependent: :destroy
end
