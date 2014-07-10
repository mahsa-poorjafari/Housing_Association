class AddCooperativeCodeToUser < ActiveRecord::Migration
  def change
    add_column :users, :cooperative_code, :integer
  end
end
