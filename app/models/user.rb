class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { minimum: 4 }

  belongs_to :group
  has_many :managed_groups, class_name: "Group", foreign_key: "manager_id"

  def manager? group
    self ==  group.manager || (group.subgroup_of.present? && manager?(group.subgroup_of))
  end

  def subordinate? user
    self.group.present? && user.manager?(self.group)
  end
end
