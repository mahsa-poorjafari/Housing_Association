class AddAttachmentPdfToPetitions < ActiveRecord::Migration
  def self.up
    change_table :petitions do |t|
      t.attachment :pdf
    end
  end

  def self.down
    drop_attached_file :petitions, :pdf
  end
end
