class RenameCompetenciesMatrixTableName < ActiveRecord::Migration
  def change
    rename_table :competency_matrices, :competencies_matrices
  end
end
