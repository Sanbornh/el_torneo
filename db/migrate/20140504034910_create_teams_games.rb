class CreateTeamsGames < ActiveRecord::Migration
  def change
    create_table :teams_games do |t|

      t.timestamps
    end
  end
end
