class AddAttachmentPdfToEducations < ActiveRecord::Migration
  def self.up
    change_table :educations do |t|
      t.attachment :pdf
    end
  end

  def self.down
    drop_attached_file :educations, :pdf
  end
end
