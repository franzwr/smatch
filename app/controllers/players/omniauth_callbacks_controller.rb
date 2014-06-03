class Players::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @player = Player.find_for_facebook_oauth(request.env["omniauth.auth"])

    if @player.persisted?
      sign_in_and_redirect @player, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      @player.save

      redirect_to root_path
    end
  end
end
