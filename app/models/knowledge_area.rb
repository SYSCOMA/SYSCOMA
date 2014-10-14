class KnowledgeArea < ActiveRecord::Base
  belongs_to :competency_matrix
  has_one :value
end
