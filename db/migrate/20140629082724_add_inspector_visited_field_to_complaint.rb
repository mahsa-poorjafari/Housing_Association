class AddInspectorVisitedFieldToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :inspector_visited, :boolean
  end
end
