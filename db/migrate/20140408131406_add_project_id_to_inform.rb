class AddProjectIdToInform < ActiveRecord::Migration
  def change
    add_column :informs, :project_id, :integer
  end
end
