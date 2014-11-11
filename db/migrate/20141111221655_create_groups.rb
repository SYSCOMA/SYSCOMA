class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.references :subgroup_of, index: true
      t.references :manager, index: true

      t.timestamps
    end
  end
end
