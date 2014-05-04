class AddScoreToTeamsGames < ActiveRecord::Migration
  def change
    add_column :teams_games, :score, :integer
  end
end
