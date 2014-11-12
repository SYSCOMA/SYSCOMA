class CreateCriterions < ActiveRecord::Migration
  def change
    create_table :criterions do |t|
      t.references :search_criteria, index: true
      t.string :comparative
      t.integer :position

      t.timestamps
    end
  end
end
