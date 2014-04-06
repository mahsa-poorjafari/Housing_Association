class CreateHouseNews < ActiveRecord::Migration
  def change
    create_table :house_news do |t|
      t.string :title
      t.text :text
      t.integer :number_Visit
      t.boolean :Important

      t.timestamps
    end
  end
end
