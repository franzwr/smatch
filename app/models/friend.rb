class Friend < ActiveRecord::Base
  #Relacion en 1 direccion del player a con b, se debe crear tambien la relacion de b con a.
  belongs_to :player
  belongs_to :player2, :class_name => "Player", :foreign_key => "player2_id"
end
