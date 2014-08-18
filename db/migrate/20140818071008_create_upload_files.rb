class CreateUploadFiles < ActiveRecord::Migration
  def change
    create_table :upload_files do |t|
      t.string :description
      t.integer :cooperative_id

      t.timestamps
    end
  end
end
