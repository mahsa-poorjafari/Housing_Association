class CreateLetterTemplates < ActiveRecord::Migration
  def change
    create_table :letter_templates do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
