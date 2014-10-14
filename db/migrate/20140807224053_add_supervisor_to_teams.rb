class AddSupervisorToTeams < ActiveRecord::Migration
  def change
    add_reference :teams, :supervisor
  end
end
