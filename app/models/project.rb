class Project < ActiveRecord::Base
  has_many :teams, through: :team_project_relationship
end
