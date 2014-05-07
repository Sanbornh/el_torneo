class DropTableTeamsGames < ActiveRecord::Migration
  def up
    drop_table :teams_games
  end

  def down
    # One way ticket
    raise ActiveRecord::IrreversibleMigration
  end
end
