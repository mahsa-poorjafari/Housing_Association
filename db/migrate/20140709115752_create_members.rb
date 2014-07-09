class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :mobile
      t.text :address
      t.string :postal_code
      t.string :father_name
      t.date :birthdate
      t.string :national_id_card
      t.string :identify_number

      t.timestamps
    end
  end
end
