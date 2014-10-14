class CreateJobRequirements < ActiveRecord::Migration
  def change
    create_table :job_requirements, id: false do |t|
      t.belongs_to :job
      t.belongs_to :requirement
    end
  end
end
