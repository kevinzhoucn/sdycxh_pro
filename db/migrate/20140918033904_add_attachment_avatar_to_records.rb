class AddAttachmentAvatarToRecords < ActiveRecord::Migration
  def self.up
    change_table :records do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :records, :avatar
  end
end
