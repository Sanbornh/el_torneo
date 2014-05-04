class Tournament

	def initialize(name, teams)
		@name = name
		@teams = teams
		@team_count = teams.length
		@number_of_games = @team_count - 1
		@first_round_games = []
		determine_num_of_rounds
		
		generate_bracket
	end

	def generate_bracket
		# Used to choose teams randomly for seeding tourny
		populate_array

		2.times do 
			team1, team2 = random_team, random_team
			game = Game.create! 
			populate_game(team1, team2, game)
			@first_round_games << game
		end

		# for first two games in array, create a game
		# set the parent id of those two games to new game id
		# put new game into array?
		# repeat until array is empty
	end

	def random_team
		random = @indices.sample(1)[0]
		team = @teams[random]
		@indices.delete(random)
		return team
	end

	def populate_array
		@indices = []
		0.upto(@team_count - 1) { |x| @indices << x }
	end

	def determine_num_of_rounds
		if @team_count >= 9 && @team_count <= 16
			@rounds = 4
		elsif @team_count >= 17 && @team_count <= 32
			@rounds = 5
		end
	end

	def populate_game(team1, team2, game)
		TeamsGame.create!(game_id: game.id, team_id: team1.id) 
		TeamsGame.create!(game_id: game.id, team_id: team2.id)	
	end

end