class AddIndexToPlayers < ActiveRecord::Migration
  def change
    add_index :friends, :player_id
    add_index :friends, :player2_id
  end
end
