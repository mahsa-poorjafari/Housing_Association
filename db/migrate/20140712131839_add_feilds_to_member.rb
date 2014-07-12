class AddFeildsToMember < ActiveRecord::Migration
  def change
    add_column :members, :deactive, :boolean
    add_column :members, :paid_member, :string
  end
end
