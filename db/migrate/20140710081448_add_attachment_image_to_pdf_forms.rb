class AddAttachmentImageToPdfForms < ActiveRecord::Migration
  def self.up
    change_table :pdf_forms do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :pdf_forms, :image
  end
end
