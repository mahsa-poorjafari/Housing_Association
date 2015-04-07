class AddReceivedLetterNumberToLetter < ActiveRecord::Migration
  def change
    add_column :letters, :received_letter_number, :string
  end
end
