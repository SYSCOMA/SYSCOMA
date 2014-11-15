class ChangeScopeFromSearchCriteria < ActiveRecord::Migration
  def change
    remove_column :search_criteria, :scope
    add_reference :search_criteria, :scope
  end
end
