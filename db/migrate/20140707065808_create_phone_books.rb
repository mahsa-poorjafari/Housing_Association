class CreatePhoneBooks < ActiveRecord::Migration
  def change
    create_table :phone_books do |t|
      t.string :preson_name
      t.string :company_name
      t.string :phone
      t.string :fax
      t.text :address

      t.timestamps
    end
  end
end
