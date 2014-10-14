class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
