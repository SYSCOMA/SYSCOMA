class CompetenceMatrix < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 1 }
  has_many :abilities
end
