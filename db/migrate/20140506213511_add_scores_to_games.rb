class AddScoresToGames < ActiveRecord::Migration
  def change
    add_column :games, :team_1_score, :integer
    add_column :games, :team_2_score, :integer
  end
end
