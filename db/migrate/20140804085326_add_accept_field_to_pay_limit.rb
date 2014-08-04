class AddAcceptFieldToPayLimit < ActiveRecord::Migration
  def change
    add_column :pay_limits, :accept_description, :string
    add_column :pay_limits, :accept, :boolean, :default => false
  end
end
