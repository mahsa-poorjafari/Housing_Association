class RemoveDisplayFieldFromComplaint < ActiveRecord::Migration
  def change
    remove_column :complaints, :display, :boolean
  end
end
