class AddFaxToCooperative < ActiveRecord::Migration
  def change
    add_column :cooperatives, :fax, :string
  end
end
