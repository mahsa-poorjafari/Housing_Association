class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :phone
      t.string :mobile
      t.date :birthdate

      t.timestamps
    end
  end
end