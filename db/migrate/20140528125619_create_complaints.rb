class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.integer :user_id
      t.text :complaint_text
      t.text :complaint_answer

      t.timestamps
    end
  end
end
