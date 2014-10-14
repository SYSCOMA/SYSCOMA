class AddSubteamAndSuperteamToTeams < ActiveRecord::Migration
  def change
    add_reference :teams, :superteam
  end
end
