class Tournament

	def initialize(type, teams)
		@type = type
		@teams = teams.to_a 
		@team_count = teams.length
		@rounds = determine_num_of_rounds
		set_num_first_round_games

		generate_tournament_structure
	end

	# Should these all be private methods?

	def set_num_first_round_games
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

	# Note that this method gets a random team
	# but it also removes that team from the array!
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

	def make_first_round
		@num_first_round_games.times { Game.create!(type: @type) }
	end

	# This method proceeds by first placing one team in every
	# first round game. Then it iterates through a second time
	# and places all the remaining teams (the ones that haven't
	# been assigned to a game) into games.
	# This means that depending on the pool size, some teams might not
	# have an opponent for the first round, effectively giving them a buy
	# to the second round. This is the desired behaviour to avoid complications
	# in later rounds. 
	# Note that it also seeds the round randomly. Currently there is no seeding 
	# based on rank.
	def seed_first_round
		games_in_round = Game.roots.where(type: @type).to_a

		2.times do
			games_in_round.each do |game|
				game.set_team(random_team!) unless @teams.empty?
			end
		end
	end


	# Creates a tournament structure above the first round
	# The only thing being set up here is empty games and the
	# proper relations between them.
	def make_other_rounds
		(@rounds - 1).times do 																				
			@previous_round = Game.roots.where(type: @type).to_a			
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