class CreateManagements < ActiveRecord::Migration
  def change
    create_table :managements do |t|
      t.string :name
      t.string :last_name
      t.string :post
      t.text :Work_Experience

      t.timestamps
    end
  end
end
