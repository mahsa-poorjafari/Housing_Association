class AddFieldToPartnership < ActiveRecord::Migration
  def change
    add_column :partnerships, :address, :text
    add_column :partnerships, :description, :text
  end
end
