class AddTrackingCodeToPayLimit < ActiveRecord::Migration
  def change
    add_column :pay_limits, :tracking_code, :string
  end
end
