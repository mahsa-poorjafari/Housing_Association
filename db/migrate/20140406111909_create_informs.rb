class CreateInforms < ActiveRecord::Migration
  def change
    create_table :informs do |t|
      t.string :title
      t.text :text
      t.integer :number_visit, :default => 0
      t.boolean :important

      t.timestamps
    end
  end
end
