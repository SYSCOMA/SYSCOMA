class CreateKnowledgeAreas < ActiveRecord::Migration
  def change
    create_table :knowledge_areas do |t|
      t.string :name

      t.timestamps
    end
    add_reference :skills, :knowledge_area
  end
end
