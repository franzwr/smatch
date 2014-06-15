class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :provider
      t.integer :uid

      t.timestamps
    end
  end
end
