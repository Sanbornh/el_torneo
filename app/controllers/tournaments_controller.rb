class TournamentsController < ApplicationController

	def show
		puts params[:id]

		if params[:id] == 'pingpong'
			@tree_data = PingPong.all.arrange_serializable.as_json.to_json
			# binding.pry
		else
			@tree_data = FuzzBall.all.arrange_serializable.as_json.to_json
			# binding.pry	
		end
		# binding.pry
	end

end