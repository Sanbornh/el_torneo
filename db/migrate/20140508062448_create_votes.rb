class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :costume_photo_id

      t.timestamps
    end
  end
end
