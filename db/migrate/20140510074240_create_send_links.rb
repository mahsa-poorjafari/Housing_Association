class CreateSendLinks < ActiveRecord::Migration
  def change
    create_table :send_links do |t|
      t.string :sender_email
      t.string :receiver_email
      t.string :current_link
      t.text :text
      t.string :subject

      t.timestamps
    end
  end
end
