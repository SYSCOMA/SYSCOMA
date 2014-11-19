class AddUserToSearchCriteria < ActiveRecord::Migration
  def change
    add_reference :search_criteria, :user, index: true
  end
end