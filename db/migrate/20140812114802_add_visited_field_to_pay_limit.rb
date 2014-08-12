class AddVisitedFieldToPayLimit < ActiveRecord::Migration
  def change
    add_column :pay_limits, :visited, :boolean, :default => false
  end
end
