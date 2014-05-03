class AddAttachmentAvatar1Avatar2ToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :avatar1
      t.attachment :avatar2
    end
  end

  def self.down
    drop_attached_file :teams, :avatar1
    drop_attached_file :teams, :avatar2
  end
end
