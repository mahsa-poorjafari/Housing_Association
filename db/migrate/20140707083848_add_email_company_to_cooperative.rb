class AddEmailCompanyToCooperative < ActiveRecord::Migration
  def change
    add_column :cooperatives, :email_company, :string
  end
end
