class ChangeUidToLongType < ActiveRecord::Migration
  def change
    if ENV["RAILS_ENV"] == "production" # PostgreSQL
        # needs explicit casting
        execute "ALTER TABLE players ALTER uid TYPE bigint USING uid::bigint"
    else
        change_column :players, :uid, :integer, :limit => 8
    end
  end
end
