class CreateCompetenceMatrices < ActiveRecord::Migration
  def change
    create_table :competence_matrices do |t|
      t.string :name

      t.timestamps
    end
  end
end
