class CreatePartnerships < ActiveRecord::Migration
  def change
    create_table :partnerships do |t|
      t.string :tracking_code
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :father_name
      t.date :birthdate
      t.boolean :gender
      t.string :phone_number
      t.string :mobile
      t.boolean :farhangi

      t.timestamps
    end
  end
end
