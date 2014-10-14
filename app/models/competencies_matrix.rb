class CompetenciesMatrix < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }
  has_many :knowledge_areas
  has_many :skills
  has_many :values_sets
  has_many :values
  accepts_nested_attributes_for :values
end
