class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name

      t.timestamps
    end
    add_reference :values, :skill
  end
end
