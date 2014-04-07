class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :text
      t.boolean :visited
      t.string :user_name

      t.timestamps
    end
  end
end
