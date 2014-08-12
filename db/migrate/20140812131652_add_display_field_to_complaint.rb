class AddDisplayFieldToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :display, :boolean, :default => false
  end
end
