class AddAttachmentImageToHouseNews < ActiveRecord::Migration
  def self.up
    change_table :house_news do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :house_news, :image
  end
end
