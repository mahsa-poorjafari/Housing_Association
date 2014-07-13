class AddImmediateToInform < ActiveRecord::Migration
  def change
    add_column :informs, :immediate, :boolean
  end
end
