class Players::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @player = Player.find_for_facebook_oauth(request.env["omniauth.auth"])

	if @player.sign_in_count == 0
	  # actually es llamado siempre
      @player.save
	  flash[:success] = "¡Felicidades! Has sido registrado exitosamente. Te contactaremos ante cualquier novedad."
	else
	  flash[:alert] = "Ya te has registrado con nosotros."
	end

	sign_out(@player) if player_signed_in?
	redirect_to root_path
  end
end
