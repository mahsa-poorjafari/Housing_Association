class AddDisplayToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :display, :boolean, :default => false
  end
end
