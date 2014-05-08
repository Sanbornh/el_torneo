class AddAttachmentPhotoToCostumePhotos < ActiveRecord::Migration
  def self.up
    change_table :costume_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :costume_photos, :photo
  end
end
