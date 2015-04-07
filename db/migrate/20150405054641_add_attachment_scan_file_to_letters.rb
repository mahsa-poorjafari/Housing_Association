class AddAttachmentScanFileToLetters < ActiveRecord::Migration
  def self.up
    change_table :letters do |t|
      t.attachment :scan_file
    end
  end

  def self.down
    remove_attachment :letters, :scan_file
  end
end
