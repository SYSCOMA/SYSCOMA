class CompetenceMatrix < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 1 }
  has_many :abilities, dependent: :destroy
  has_many :knowledge_areas, dependent: :destroy
  accepts_nested_attributes_for :abilities,
      :reject_if => lambda { |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :knowledge_areas,
      :reject_if => lambda { |a| a[:name].blank? }, allow_destroy: true
end
