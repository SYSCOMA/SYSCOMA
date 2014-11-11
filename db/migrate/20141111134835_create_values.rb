class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :value
      t.integer :rank
      t.references :competence_matrix, index: true

      t.timestamps
    end
  end
end
