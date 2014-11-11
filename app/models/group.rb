class Group < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 1 },
      uniqueness: true

  belongs_to :subgroup_of, class_name: "Group"
  has_many :subgroups, class_name: "Group", 
      foreign_key: "subgroup_of_id", dependent: :destroy
  belongs_to :manager, class_name: "User"
  has_many :users
end
