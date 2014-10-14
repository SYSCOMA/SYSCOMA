class AddTeamAndJobToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :job
  end
end
