class AddProjectIdToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :project_id, :integer
  end
end
