class AddFieldToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :user_email, :string
    add_column :complaints, :user_phone, :string
  end
end
