class UserCompetencies < ActiveRecord::Base
  belongs_to :competencies_matrix
  belongs_to :user
end
