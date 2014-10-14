class CreateCompetencyMatrices < ActiveRecord::Migration
  def change
    create_table :competency_matrices do |t|
      t.string :name

      t.timestamps
    end
    add_reference :knowledge_areas, :competency_matrix
  end
end
