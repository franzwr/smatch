class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :provider
      t.string :uid
      t.text   :friend

      t.timestamps
    end
  end
end
