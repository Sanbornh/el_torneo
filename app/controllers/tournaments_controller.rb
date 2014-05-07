class TournamentsController < ApplicationController

	def show
		if params[:id] == "pingpong"
			@type = "PingPong"
		else 
			@type = "FuzzBall"
		end 

		@first_round_games = Game.at_depth(3)
	end

end