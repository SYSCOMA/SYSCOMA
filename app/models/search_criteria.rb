class SearchCriteria < ActiveRecord::Base
  has_many :criteria, dependent: :destroy
end
