class CreateCooperatives < ActiveRecord::Migration
  def change
    create_table :cooperatives do |t|
      t.string :name
      t.string :managment_name
      t.string :board_Chairman_name
      t.text :address
      t.string :phone
      t.text :website

      t.timestamps
    end
  end
end
