class AddAttachmentAvatarToSlides < ActiveRecord::Migration
  def self.up
    change_table :slides do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :slides, :avatar
  end
end
