class AddUserNameToCommentComplaints < ActiveRecord::Migration
  def change
    add_column :comment_complaints, :user_name, :string
    add_column :comment_complaints, :user_email, :string
  end
end
