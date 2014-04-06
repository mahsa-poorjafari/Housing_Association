class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :address
      t.text :description
      t.string :Area
      t.integer :unit
      t.boolean :Status

      t.timestamps
    end
  end
end
