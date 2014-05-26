class CreatePayLimits < ActiveRecord::Migration
  def change
    create_table :pay_limits do |t|
      t.string :amount
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
