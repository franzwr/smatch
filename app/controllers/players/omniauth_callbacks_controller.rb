class Players::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    oauth = request.env["omniauth.auth"]
    @player = Player.find_for_facebook_oauth(oauth)
	if @player.sign_in_count == 0
	  # actually es llamado siempre
      @player.save
	  flash[:success] = "¡Felicidades! Has sido registrado exitosamente. Te contactaremos ante cualquier novedad."
	else
	  flash[:alert] = "Ya te has registrado con nosotros."
	end
	session["devise.user_attributes"] = @player.attributes
	#render :text => session["devise.user_attributes"]
	token = FbGraph::User.me(@player.uid)
    friends = token.friends
    for f in friends
      u = Player.find_by(:uid => f.credentials.token)
      if u != nil and u.provider == token.provider
        amigosPorLaDerecha = Friend.find_by(:player_id => @player.id, :player2_id => u.id)
        amigosPorLaIzquierda = Friend.find_by(:player2_id => @player.id, :player_id => u.id)
      end
      if amigosPorLaDerecha == nil and amigosPorLaIzquierda == nil
        amigoDerecha = Friend.new
        amigoDerecha.player_id = @player.id
        amigoDerecha.player2_id = u.id
        amigoDerecha.save
        amigoIzquierda = Friend.new
        amigoIzquierda.player_id = u.id
        amigoIzquierda.player2_id = @player.id
        amigoIzquierda.save
      end
    end
    
	sign_out(@player) if player_signed_in?
	redirect_to root_path
  end
end
