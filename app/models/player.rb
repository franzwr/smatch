class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
		 :omniauthable, :omniauth_providers => [:facebook]
  has_many :friendships
  has_many :friends, :through => :friendships

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |player|
      player.provider = auth.provider
      player.uid = auth.uid
	  player.token = auth.credentials.token
      player.email = auth.info.email
      player.first_name = auth.info.first_name
      player.last_name = auth.info.last_name
      player.password = Devise.friendly_token[0,20] # regenera la password en cada login plz
  	end
  end
end
