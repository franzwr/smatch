class Players::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    oauth = request.env["omniauth.auth"]
    @player = Player.find_for_facebook_oauth(oauth)
	if @player.sign_in_count == 0
      @player.save
	  flash[:success] = "¡Felicidades! Has sido registrado exitosamente. Te contactaremos ante cualquier novedad."
	else
	  flash[:alert] = "Ya te has registrado con nosotros."
	end

    # add friends
 	if Player.count > 1
 	  graph = FbGraph::User.me(oauth.credentials.token)
 
       for f in graph.friends
         u = Player.find_by_uid(f.identifier)
 		if u != nil
 		  # if no friendship is found... create it
           if Friendship.where("player_id = :p1 and friend_id = :p2 or
                                player_id = :p2 and friend_id = :p1",
                                p1: @player.id, p2: u.id).empty?
 		    Friendship.new(player_id: @player.id, friend_id: u.id, confirmed: 1).save
 		    Friendship.new(friend_id: @player.id, player_id: u.id, confirmed: 1).save
           end
 		end
       end
     end
    
	sign_out(@player) if player_signed_in?
	redirect_to root_path
  end
end
