class JobRequirements < ActiveRecord::Base
  belongs_to :requirement
  belongs_to :job
end
