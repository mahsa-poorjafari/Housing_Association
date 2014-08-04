class RemoveUserIdFromPayLimit < ActiveRecord::Migration
  def change
    remove_column :pay_limits, :user_id, :integer
  end
end
