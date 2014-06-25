class RemoveFieldFromComplaint < ActiveRecord::Migration
  def change
    remove_column :complaints, :user_id, :integer
  end
end
