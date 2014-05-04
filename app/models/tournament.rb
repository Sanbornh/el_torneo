class Tournament

	def initialize(name, teams)
		@name = name
		@teams_in_tourny = teams.to_a 
		@team_count = teams.length
		determine_num_of_rounds
		generate_bracket
	end

	def generate_bracket
		seed_first_round
		@next_round_games = []

		(@first_round_games.length / 2).times do 
			child_games = @first_round_games.shift(2)
			parent_game = Game.create
			child_games.each do |game|
				game.parent = parent_game
				game.save
			end

			@next_round_games << parent_game
		end

		# for first two games in array, create a game
		# set the parent id of those two games to new game id
		# put new game into array?
		# repeat until array is empty
	end

	def random_team!
		@teams_in_tourny.shuffle!.pop
	end

	def determine_num_of_rounds
		if @team_count >= 9 && @team_count <= 16
			@rounds = 4
		elsif @team_count <= 32
			@rounds = 5
		end
	end

	def populate_game(team1, team2, game)
		TeamsGame.create!(game_id: game.id, team_id: team1.id) 
		TeamsGame.create!(game_id: game.id, team_id: team2.id)	
	end

	def seed_first_round
		@first_round_games = [] 
		2.times do 
			team1, team2 = random_team!, random_team!
			game = Game.create! 
			populate_game(team1, team2, game)
			@first_round_games << game
		end
	end

end