class CreateCriteria < ActiveRecord::Migration
  def change
    create_table :criteria do |t|
      t.references :search_criteria, index: true
      t.string :comparative
      t.integer :position

      t.timestamps
    end
    add_reference :competences, :criterion, index: true
  end
end
