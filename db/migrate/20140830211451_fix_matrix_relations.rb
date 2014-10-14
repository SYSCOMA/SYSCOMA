class FixMatrixRelations < ActiveRecord::Migration
  def change
    add_column :competencies_matrices, :reference_matrix, :boolean
    add_reference :skills, :competencies_matrix
    remove_reference :skills, :knowledge_area
    add_reference :values, :knowledge_area
  end
end
