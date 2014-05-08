class CreateCostumePhotos < ActiveRecord::Migration
  def change
    create_table :costume_photos do |t|
      t.string :title

      t.timestamps
    end
  end
end
