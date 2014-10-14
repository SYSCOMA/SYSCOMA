class CreateHierarchyLevels < ActiveRecord::Migration
  def change
    create_table :hierarchy_levels do |t|
      t.string :name
      t.references :below_level

      t.timestamps
    end
  end
end
