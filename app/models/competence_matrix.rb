class CompetenceMatrix < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 1 }

  has_many :abilities, dependent: :destroy
  has_many :knowledge_areas, dependent: :destroy
  has_many :values, dependent: :destroy
  has_many :competences, through: :abilities

  accepts_nested_attributes_for :abilities,
      reject_if: lambda { |a| a[:name].blank? }, 
      allow_destroy: true
  accepts_nested_attributes_for :knowledge_areas,
      reject_if: lambda { |a| a[:name].blank? },
      allow_destroy: true
  accepts_nested_attributes_for :values,
      reject_if: lambda { |a| a[:value].blank? || a[:rank].blank? },
      allow_destroy: true
end
