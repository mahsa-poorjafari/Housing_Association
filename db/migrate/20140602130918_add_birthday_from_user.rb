class AddBirthdayFromUser < ActiveRecord::Migration
  def change
    add_column :users, :birthdate, :string
  end
end
