class Friend < ActiveRecord::Base
  belongs_to :player
  belongs_to :player2, :class_name => "Player", :foreign_key => "player2_id"
end
