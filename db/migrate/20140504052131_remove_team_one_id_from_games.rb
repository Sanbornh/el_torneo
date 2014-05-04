class RemoveTeamOneIdFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :team_one_id, :integer
  end
end
