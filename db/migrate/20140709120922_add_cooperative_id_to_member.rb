class AddCooperativeIdToMember < ActiveRecord::Migration
  def change
    add_column :members, :cooperative_id, :integer
  end
end
