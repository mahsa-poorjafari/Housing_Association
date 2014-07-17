class CreateContactsLetters < ActiveRecord::Migration
  def change
    create_table :contacts_letters, :id => false do |t|
        t.references :contact
        t.references :letter
    end
  end
end
