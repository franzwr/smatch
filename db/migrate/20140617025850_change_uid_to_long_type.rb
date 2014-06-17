class ChangeUidToLongType < ActiveRecord::Migration
  def change
    change_column, :players, :uid, :integer, :limit => 8
  end
end
