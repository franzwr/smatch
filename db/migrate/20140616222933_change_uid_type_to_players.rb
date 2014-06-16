class ChangeUidTypeToPlayers < ActiveRecord::Migration
  def change
  	change_column :players, :uid,  :string
  end
end
