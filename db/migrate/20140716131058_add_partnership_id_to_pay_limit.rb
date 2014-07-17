class AddPartnershipIdToPayLimit < ActiveRecord::Migration
  def change
    add_column :pay_limits, :partnership_id, :integer
  end
end
