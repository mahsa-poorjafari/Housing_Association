class AddAdminVisitedToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :admin_visited, :boolean, :default => false
  end
end
