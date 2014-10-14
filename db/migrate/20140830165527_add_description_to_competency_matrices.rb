class AddDescriptionToCompetencyMatrices < ActiveRecord::Migration
  def change
    add_column :competency_matrices, :short_description, :string
    add_column :competency_matrices, :description, :text
  end
end
