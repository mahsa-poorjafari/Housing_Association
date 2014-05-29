class CreateCommentComplaints < ActiveRecord::Migration
  def change
    create_table :comment_complaints do |t|
      t.integer :user_id
      t.integer :complaint_id
      t.text :text

      t.timestamps
    end
  end
end
