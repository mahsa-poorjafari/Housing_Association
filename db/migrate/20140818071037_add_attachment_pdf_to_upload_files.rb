class AddAttachmentPdfToUploadFiles < ActiveRecord::Migration
  def self.up
    change_table :upload_files do |t|
      t.attachment :pdf
    end
  end

  def self.down
    drop_attached_file :upload_files, :pdf
  end
end
