class AddIndexToFriendships < ActiveRecord::Migration
  def change
    add_index :friendships, :player_id
    add_index :friendships, :friend_id
  end
end
