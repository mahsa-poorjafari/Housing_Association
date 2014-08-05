class AddLetterNumberToLetter < ActiveRecord::Migration
  def change
    add_column :letters, :letter_number, :string
  end
end
