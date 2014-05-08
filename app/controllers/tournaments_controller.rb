class TournamentsController < ApplicationController

	def show
		@tree_data = Game.arrange_serializable.as_json.to_json
	end

end