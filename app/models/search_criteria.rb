class SearchCriteria < ActiveRecord::Base
  validates :name, presence: true, 
      length: { minimum: 1 }, 
      uniqueness: true

  has_many :criteria, dependent: :destroy
  belongs_to :scope, class_name: 'Group'
  belongs_to :user

  def formula
    composition
  end
end
