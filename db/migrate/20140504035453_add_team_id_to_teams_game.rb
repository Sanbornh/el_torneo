class AddTeamIdToTeamsGame < ActiveRecord::Migration
  def change
    add_column :teams_games, :team_id, :integer
  end
end
