class HierarchyLevel < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }

  belongs_to :job
  has_one :above_level, class_name: "HierarchyLevel", foreign_key: :above_id
  belongs_to :below_level, class_name: "HierarchyLevel"
end
