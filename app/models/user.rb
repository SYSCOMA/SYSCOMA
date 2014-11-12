class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { minimum: 4 }

  belongs_to :group
  has_many :managed_groups, class_name: "Group", foreign_key: "manager_id"

  def manager? group
    if self ==  group.manager
      true
    elsif group.subgroup_of.present?
      manager? group
    else
      false
    end
  end
end
