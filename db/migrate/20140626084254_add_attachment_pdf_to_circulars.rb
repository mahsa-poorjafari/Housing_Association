class AddAttachmentPdfToCirculars < ActiveRecord::Migration
  def self.up
    change_table :circulars do |t|
      t.attachment :pdf
    end
  end

  def self.down
    drop_attached_file :circulars, :pdf
  end
end
