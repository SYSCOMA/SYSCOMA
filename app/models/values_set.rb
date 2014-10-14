class ValuesSet < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 1 }
  validates :value, presence: true
  belongs_to :competency_matrix
end
