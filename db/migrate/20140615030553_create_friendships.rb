class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
	  t.belongs_to :player
	  t.belongs_to :friend

	  t.boolean :confirmed

      t.timestamps
    end
  end
end
