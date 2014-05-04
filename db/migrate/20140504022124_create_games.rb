class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner
      t.integer :team_one_id
      t.integer :team_two_id
      t.string :type

      t.timestamps
    end
  end
end
