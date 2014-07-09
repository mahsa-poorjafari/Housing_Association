class AddMemberPostIdToMember < ActiveRecord::Migration
  def change
    add_column :members, :member_post_id, :integer
  end
end
