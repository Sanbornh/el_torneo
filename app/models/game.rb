class Game < ActiveRecord::Base

  has_many :teams_games
  has_many :teams, through: :teams_games
  has_ancestry

  scope :ping_pong, -> { where(type: 'PingPong')}
  scope :fuzz_ball, -> { where(type: 'FuzzBall')}

  delegate :pingpong, :fuzzball, to: :games

  def set_team(team)
  	teams_game = TeamsGame.where(game_id: self) 
  	if teams_game.count == 2
			puts "Someone tried to assign a third team to a game"
		else 
			TeamsGame.create!(game_id: self.id, team_id: team.id)
		end
  end
end