class AddAttachmentImageToManagements < ActiveRecord::Migration
  def self.up
    change_table :managements do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :managements, :image
  end
end
