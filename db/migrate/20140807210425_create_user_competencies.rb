class CreateUserCompetencies < ActiveRecord::Migration
  def change
    create_table :user_competencies, id: false do |t|
      t.belongs_to :user
      t.belongs_to :competency_matrix
    end
  end
end
