class Job < ActiveRecord::Base
  has_one :hierarchy_level
  belongs_to :team
  has_many :users
  has_many :requirements, class_name: "CompetencyMatrix", through: :job_requirements
end