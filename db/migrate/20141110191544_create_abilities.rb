class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :name
      t.references :competence_matrix

      t.timestamps
    end
  end
end
