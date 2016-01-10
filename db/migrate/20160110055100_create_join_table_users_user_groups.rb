class CreateJoinTableUsersUserGroups < ActiveRecord::Migration
  def change
    create_join_table :users, :user_groups do |t|
      t.index [:user_id, :user_group_id]
      t.index [:user_group_id, :user_id]
    end
  end
end
