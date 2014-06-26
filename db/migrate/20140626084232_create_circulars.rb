class CreateCirculars < ActiveRecord::Migration
  def change
    create_table :circulars do |t|
      t.string :title
      t.integer :project_id
      t.text :description

      t.timestamps
    end
  end
end
