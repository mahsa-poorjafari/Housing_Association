class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :letter_type
      t.string :summary
      t.date :sent_date
      t.date :received_date
      t.integer :sender
      t.text :content
      t.string :attachment

      t.timestamps
    end
  end
end
