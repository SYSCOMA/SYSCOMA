class Team < ActiveRecord::Base
  has_many :projects, through: :team_project_relationship
  has_many :jobs
  has_many :subteams, class_name: "Team"
  belongs_to :superteam, class_name: "Team", foreign_key: "superteam_id"
  belongs_to :supervisor, class_name: "User"
end
