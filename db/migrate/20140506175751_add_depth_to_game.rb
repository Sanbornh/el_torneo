class AddDepthToGame < ActiveRecord::Migration
  def change
  	add_column :games, :ancestry_depth, :integer, :default => 0
  end
end
