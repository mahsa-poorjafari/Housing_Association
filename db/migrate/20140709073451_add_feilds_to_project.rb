class AddFeildsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :land_area, :string
    add_column :projects, :floor, :string
    add_column :projects, :block, :string
    add_column :projects, :start_year, :integer
    add_column :projects, :finish_year, :integer
  end
end
