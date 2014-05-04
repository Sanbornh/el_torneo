class AddAncestryToGames < ActiveRecord::Migration
  def change
    add_column :games, :ancestry, :string
    add_index :games, :ancestry 
  end
end
