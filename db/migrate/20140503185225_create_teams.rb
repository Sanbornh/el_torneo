class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.integer :score
      t.string :player1_name
      t.string :player2_name

      t.timestamps
    end
  end
end
