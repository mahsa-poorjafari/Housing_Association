class RenameLetterSenderToSenderId < ActiveRecord::Migration
  def change
    rename_column :letters, :sender, :sender_id
  end
end
