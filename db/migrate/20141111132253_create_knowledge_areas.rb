class CreateKnowledgeAreas < ActiveRecord::Migration
  def change
    create_table :knowledge_areas do |t|
      t.string :name
      t.references :competence_matrix, index: true

      t.timestamps
    end
  end
end
