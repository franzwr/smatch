class AddTokenToPlayer < ActiveRecord::Migration
  def change
    change_table :players do |t|
	  t.string :token
	end
  end
end
