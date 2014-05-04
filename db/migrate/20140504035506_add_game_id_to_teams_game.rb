class AddGameIdToTeamsGame < ActiveRecord::Migration
  def change
    add_column :teams_games, :game_id, :integer
  end
end
