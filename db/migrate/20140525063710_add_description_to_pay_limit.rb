class AddDescriptionToPayLimit < ActiveRecord::Migration
  def change
    add_column :pay_limits, :description, :text
  end
end
