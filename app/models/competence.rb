class Competence < ActiveRecord::Base
  belongs_to :criterion
  belongs_to :user
  belongs_to :knowledge_area
  belongs_to :ability
  belongs_to :value
end
