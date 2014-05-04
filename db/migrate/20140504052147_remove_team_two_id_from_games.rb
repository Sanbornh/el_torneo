class RemoveTeamTwoIdFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :team_two_id, :integer
  end
end
