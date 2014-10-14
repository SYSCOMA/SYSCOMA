class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.references :team
      t.timestamps
    end
    add_reference :hierarchy_levels, :jobs
  end
end
