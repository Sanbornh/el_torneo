class Tournament

	def initialize(type, teams)
		# @name = name
		@type = type
		@teams = teams.to_a 
		@team_count = teams.length
		@rounds = determine_num_of_rounds
		generate_num_first_round_games
		generate_tournament_structure
	end

	def generate_num_first_round_games
		if @team_count <= 8
			@num_first_round_games = 4
		elsif @team_count <= 16
			@num_first_round_games = 8
		elsif @team_count <= 32
			@num_first_round_games = 16
		end
	end

	def generate_tournament_structure
		make_first_round
		seed_first_round
		make_other_rounds
	end

	def random_team!
		@teams.shuffle!.pop
	end

	def determine_num_of_rounds
		if @team_count >= 9 && @team_count <= 16
			4
		elsif @team_count <= 32
			5
		end
	end

	def populate_game(team1, team2, game)
		TeamsGame.create!(game_id: game.id, team_id: team1.id) 
		TeamsGame.create!(game_id: game.id, team_id: team2.id)	
	end

	def make_first_round
		@num_first_round_games.times { Game.create!(type: @type) }
	end

	def seed_first_round
		games_in_round = Game.roots.to_a
		until @teams.empty? do
			games_in_round.each do |game|
				game.set_team(random_team!)
			end
		end


		# (@team_count / 2).times do 
		# 	team1, team2 = random_team!, random_team!
		# 	game = Game.create!(type: @type) 
		# 	populate_game(team1, team2, game)
		# end
	end

	def make_other_rounds
		(@rounds - 1).times do 										# do this x times where x is number of rounds after first round
			@previous_round = Game.roots.to_a				# make an array with all of the games from the previous round 
			(@previous_round.length / 2).times do 
				child_games = @previous_round.shift(2)
				parent_game = Game.create!(type: @type)
				child_games.each do |game|
					game.parent = parent_game
					game.save
				end
			end
		end
	end

end