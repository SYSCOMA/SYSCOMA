class Group < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 1 },
      uniqueness: true

  belongs_to :subgroup_of, class_name: "Group"
  has_many :subgroups, class_name: "Group", 
      foreign_key: "subgroup_of_id", dependent: :destroy
  belongs_to :manager, class_name: "User"
  has_many :users

  def subordinated_groups
    groups = []
    subgroups.each do |subgroup|
      groups.push subgroup
      groups.concat subgroup.subordinated_groups
    end
    groups
  end

  def superior_groups
    groups = []
    if subgroup_of.present?
      groups = [subgroup_of].concat subgroup_of.superior_groups
    end
    groups
  end

  def subordinate? group
      superior_groups.include? group
  end
end
