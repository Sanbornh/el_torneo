class Tournament

	def initialize(name, teams)
		@name = name
		@teams = teams
		@team_count = teams.length
		@number_of_games = @team_count - 1

		if @team_count >= 9 && @team_count <= 16
			@rounds = 4
		elsif @team_count >= 17 && @team_count <= 32
			@rounds = 5
		end

		generate_bracket
	end

	def generate_bracket
		
		@first_round_games = []

		# Populate an array to reference @teams
		@indices = []
		0.upto(@team_count - 1) do |x|
			@indices << x
		end		

		2.times do 
			random = @indices.sample(1)[0]
			# binding.pry
			team1 = @teams[random]
			@indices.delete(random)

			random = @indices.sample(1)[0]
			# binding.pry
			team2 = @teams[random]
			@indices.delete(random)

			game = Game.create! 
			join = TeamsGame.create!(game_id: game.id, team_id: team1.id) 
			join = TeamsGame.create!(game_id: game.id, team_id: team2.id)	
			@first_round_games << game
		end


		# create two root children
		# create two children of those children
		# until depth = rounds

	end

end