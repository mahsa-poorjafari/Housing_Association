class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :phone
      t.string :mobile
      t.string :email
      t.string :name
      t.string :lastname

      t.timestamps
    end
  end
end
