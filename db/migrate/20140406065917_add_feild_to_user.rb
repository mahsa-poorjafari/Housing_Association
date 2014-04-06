class AddFeildToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :mobile, :string
    add_column :users, :gender, :boolean
    add_column :users, :father_name, :string
    add_column :users, :address, :text
    add_column :users, :identify_code, :string
    add_column :users, :birth_date, :date
  end
end
