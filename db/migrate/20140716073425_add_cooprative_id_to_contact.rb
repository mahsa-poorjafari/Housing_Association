class AddCooprativeIdToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :cooperative_id, :integer
  end
end
