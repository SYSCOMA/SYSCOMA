class Value < ActiveRecord::Base
  belongs_to :skill
  belongs_to :knowledge_area
  belongs_to :competencies_matrix
  has_one :values_set
end
