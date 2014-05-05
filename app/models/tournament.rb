class Tournament

	def initialize(name, teams)
		@name = name
		@teams_in_tourny = teams.to_a 
		@team_count = teams.length
		@rounds = determine_num_of_rounds
		generate_tournament_structure
	end

	def generate_tournament_structure
		seed_first_round
		generate_other_rounds
	end

	def random_team!
		@teams_in_tourny.shuffle!.pop
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

	def seed_first_round
		(@team_count / 2).times do 
			team1, team2 = random_team!, random_team!
			game = Game.create! 
			populate_game(team1, team2, game)
		end
	end

	def generate_other_rounds

		(@rounds - 1).times do 								# do this x times where x is number of rounds after first round

			@previous_round = Game.roots.to_a		# make an array with all of the games from the previous round 

			(@previous_round.length / 2).times do 

				child_games = @previous_round.shift(2)
				parent_game = Game.create

				child_games.each do |game|
					game.parent = parent_game
					game.save
				end
			end
		end
	end
end