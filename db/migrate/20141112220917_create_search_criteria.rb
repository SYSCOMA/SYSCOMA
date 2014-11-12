class CreateSearchCriteria < ActiveRecord::Migration
  def change
    create_table :search_criteria do |t|
      t.string :name
      t.integer :scope
      t.text :composition

      t.timestamps
    end
  end
end
