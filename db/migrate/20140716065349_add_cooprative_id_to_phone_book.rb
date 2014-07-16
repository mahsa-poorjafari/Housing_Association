class AddCooprativeIdToPhoneBook < ActiveRecord::Migration
  def change
    add_column :phone_books, :cooperative_id, :integer
  end
end
