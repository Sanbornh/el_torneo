class Game < ActiveRecord::Base

  has_many :teams_games
  has_many :teams, through: :teams_games
  has_ancestry

  scope :ping_pong, -> { where(type: 'PingPong')}
  scope :fuzz_ball, -> { where(type: 'FuzzBall')}

  delegate :pingpong, :fuzzball, to: :games

  def set_team(team)
  	@teams_game = TeamsGame.where(game_id: self) 

  	if @teams_game.count == 2
      flash.now[:alert] = "This game already has two teams"
		else 
			TeamsGame.create!(game_id: self.id, team_id: team.id)
		end
  end

  def current_game_teams
    @teams_game = TeamsGame.where(game_id: self)

    first_team_id = @teams_game[0].team_id
    second_team_id = @teams_game[1].team_id

    first_team_name = Team.find(first_team_id).team_name
    second_team_name = Team.find(second_team_id).team_name

    first_team_player1 = Team.find(first_team_id).player1_name
    first_team_player2 = Team.find(first_team_id).player2_name

    second_team_player1 = Team.find(second_team_id).player1_name
    second_team_player2 = Team.find(second_team_id).player2_name

    "#{first_team_name} (#{first_team_player1} and #{first_team_player2}) vs. #{second_team_name} (#{second_team_player1} and #{second_team_player2})"
  end

  def team_score
    @teams_game = TeamsGame.where(game_id: self)
    first_team_score = @teams_game[0].score
    second_team_score = @teams_game[1].score

    "#{first_team_score} - #{second_team_score}"
  end

end