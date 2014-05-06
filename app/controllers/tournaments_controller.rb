class TournamentsController < ApplicationController

	def show
		if params[:id] == "pingpong"
			@type = "PingPong"
		else 
			@type = "FuzzBall"
		end
	end

end