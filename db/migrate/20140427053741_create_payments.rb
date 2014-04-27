class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.string :bank_draft_no

      t.timestamps
    end
  end
end
