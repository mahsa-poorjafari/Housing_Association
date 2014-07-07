class DropTableProjectsUsers < ActiveRecord::Migration
  def up
    drop_table :table_projects_users
  end
end
