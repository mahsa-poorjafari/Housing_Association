class AddEhteramnToLetter < ActiveRecord::Migration
  def change
    add_column :letters, :ehteramn, :string
  end
end
