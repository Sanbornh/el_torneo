class DropPlayers < ActiveRecord::Migration
  def up
    if table_exists?(:players)
      drop_table :players
    end
  end

  def down

  end
end
