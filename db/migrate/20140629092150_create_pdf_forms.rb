class CreatePdfForms < ActiveRecord::Migration
  def change
    create_table :pdf_forms do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
