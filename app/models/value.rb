class Value < ActiveRecord::Base
  validates :value, presence: true, 
      length: { minimum: 1 }, 
      uniqueness: { scope: :competence_matrix }
  validates :rank, presence: true, 
      numericality: { only_integer: true, greater_than_or_equal_to: 1 },
      uniqueness: { scope: :competence_matrix }

  belongs_to :competence_matrix 
  belongs_to :ability
end
