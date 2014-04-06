class AddAttachmentImageToInforms < ActiveRecord::Migration
  def self.up
    change_table :informs do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :informs, :image
  end
end
