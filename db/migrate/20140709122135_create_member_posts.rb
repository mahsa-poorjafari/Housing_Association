class CreateMemberPosts < ActiveRecord::Migration
  def change
    create_table :member_posts do |t|
      t.string :title

      t.timestamps
    end
  end
end
