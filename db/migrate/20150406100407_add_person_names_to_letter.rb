class AddPersonNamesToLetter < ActiveRecord::Migration
  def change
    add_column :letters, :senderpreson_name, :string
    add_column :letters, :sendercompany_name, :string
  end
end
