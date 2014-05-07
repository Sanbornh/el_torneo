class AddTeamsToGames < ActiveRecord::Migration
  def change
    add_column :games, :team_1_id, :integer
    add_column :games, :team_2_id, :integer
  end
end
