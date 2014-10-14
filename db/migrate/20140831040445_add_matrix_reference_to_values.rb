class AddMatrixReferenceToValues < ActiveRecord::Migration
  def change
    add_reference :values, :competencies_matrix
  end
end
