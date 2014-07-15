class RenamePhonebooksToContacts < ActiveRecord::Migration
  def change
    rename_table :phone_books, :contacts
  end
end
