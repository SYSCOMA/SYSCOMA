class CreateValuesSets < ActiveRecord::Migration
  def change
    create_table :values_sets do |t|
      t.string :name
      t.integer :value
      t.references :competency_matrix, index: true

      t.timestamps
    end
  end
end
