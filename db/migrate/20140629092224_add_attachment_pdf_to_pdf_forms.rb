class AddAttachmentPdfToPdfForms < ActiveRecord::Migration
  def self.up
    change_table :pdf_forms do |t|
      t.attachment :pdf
    end
  end

  def self.down
    drop_attached_file :pdf_forms, :pdf
  end
end
