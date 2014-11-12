class CreateCompetences < ActiveRecord::Migration
  def change
    create_table :competences do |t|
      t.references :user, index: true
      t.references :knowledge_area, index: true
      t.references :ability, index: true
      t.references :value, index: true

      t.timestamps
    end
  end
end
