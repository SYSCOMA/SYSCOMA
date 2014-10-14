class RenameCompetenciesMatrixForeingFields < ActiveRecord::Migration
  def change
    rename_index :values_sets, :competency_matrix_id, :competencies_matrix_id
    rename_index :knowledge_areas, :competency_matrix_id, :competencies_matrix_id
    rename_index :user_competencies, :competency_matrix_id, :competencies_matrix_id
    rename_column :values_sets, :competency_matrix_id, :competencies_matrix_id
    rename_column :knowledge_areas, :competency_matrix_id, :competencies_matrix_id
    rename_column :user_competencies, :competency_matrix_id, :competencies_matrix_id
  end
end
