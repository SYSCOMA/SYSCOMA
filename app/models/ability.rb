class Ability < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 1 },
      uniqueness: { scope: :competence_matrix }

  belongs_to :competence_matrix
  has_many :values, dependent: :destroy
  has_many :competences, dependent: :destroy

  accepts_nested_attributes_for :values,
      reject_if: lambda { |a| a[:value].blank? || a[:rank].blank? },
      allow_destroy: true
end
