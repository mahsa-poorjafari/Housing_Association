class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :address, :text
    add_column :users, :national_code, :string
  end
end
