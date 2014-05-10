class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.belongs_to :player
      t.belongs_to :player2
      
      t.timestamps
    end
  end
end
