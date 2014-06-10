class LandingController < ApplicationController
  def index
  end

  	def testing
		@player = Player.first
	end
end
