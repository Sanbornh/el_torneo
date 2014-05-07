class Game < ActiveRecord::Base

  has_many :teams
  # has_many :teams, through: :teams_games
  
  belongs_to :team_1, :class_name => 'Team', :foreign_key => 'team_1_id'
  belongs_to :team_2, :class_name => 'Team', :foreign_key => 'team_2_id'

  has_ancestry :cache_depth => true

  scope :ping_pong, -> { where(type: 'PingPong')}
  scope :fuzz_ball, -> { where(type: 'FuzzBall')}

  delegate :pingpong, :fuzzball, to: :games

  # def set_team_old(team)
  # 	@teams_game = TeamsGame.where(game_id: self) 

  # 	if @teams_game.count == 2
  #     flash.now[:alert] = "This game already has two teams"
		# else 
		# 	TeamsGame.create!(game_id: self.id, team_id: team.id)
		# end
  # end

  def set_team(team)
    if !team_1_id.blank? && !team_2_id.blank?
      flash.now[:alert] = "This game already has two teams"
    elsif team_1_id.blank? && team_2_id.blank?
      team_1_id = team.id
    elsif !team_1_id.blank? && team_2_id.blank?
      team_2_id = team.id
    elsif team_1_id.blank? && !team_2_id.blank?
      team_1_id = team.id
    end
    self.save
  end

  # def current_game_teams_old
  #   @teams_game = TeamsGame.where(game_id: self)

  #   first_team_id = @teams_game[0].team_id
  #   second_team_id = @teams_game[1].team_id

  #   first_team_name = Team.find(first_team_id).team_name
  #   second_team_name = Team.find(second_team_id).team_name

  #   first_team_player1 = Team.find(first_team_id).player1_name
  #   first_team_player2 = Team.find(first_team_id).player2_name

  #   second_team_player1 = Team.find(second_team_id).player1_name
  #   second_team_player2 = Team.find(second_team_id).player2_name

  #   "#{first_team_name} (#{first_team_player1} and #{first_team_player2}) vs. #{second_team_name} (#{second_team_player1} and #{second_team_player2})"
  # end

  def current_game_teams
    first_team = team_1
    second_team = team_2
    "#{first_team.team_name} (#{first_team.player1_name} and #{first_team.player2_name}) vs. #{second_team.team_name} (#{second_team.player1_name} and #{second_team.player2_name})"
  end  

  # def team_score_old
  #   @teams_game = TeamsGame.where(game_id: self)
  #   first_team_score = @teams_game[0].score
  #   second_team_score = @teams_game[1].score

  #   "#{first_team_score} - #{second_team_score}"
  # end

  def team_score
    "#{team_1_score} - #{team_2_score}"
  end

  def winner 
    if self.type == "PingPong"
      if (team_1_score >= (team_2_score + 2)) && (team_1_score >= 21)
        self.winner = team_1.id
      elsif (team_2_score >= (team_1_score + 2)) && (team_2_score >= 21)
        self.winner = team_2.id
      end
    elsif self.type == "FuzzBall"
      if team_1_score > team_2_score && team_1_score == 8
        self.winner = team_1.id
      elsif team_2_score > team_1_score && team_2_score == 8
        self.winner = team_2.id
      end
    end
  end

  def teams
    Team.where("id in (?)", [team_1_id, team_2_id])
  end


end