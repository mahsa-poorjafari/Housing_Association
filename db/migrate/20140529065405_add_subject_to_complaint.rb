class AddSubjectToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :subject, :string
  end
end
