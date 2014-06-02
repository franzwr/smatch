class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
		 :omniauthable, :omniauth_providers => [:facebook]
  has_many :friends, :dependent => :destroy

		def self.find_for_facebook_oauth(auth)
			where(auth.slice(:provider, :uid)).first_or_create do |player|
				player.provider = auth.provider
				player.uid = auth.uid
				player.email = auth.info.email
				player.first_name = auth.info.first_name
				player.last_name = auth.info.last_name
			end
		end
end
