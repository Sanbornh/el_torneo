class Game < ActiveRecord::Base

  has_many :teams
  belongs_to :team_1, :class_name => 'Team', :foreign_key => 'team_1_id'
  belongs_to :team_2, :class_name => 'Team', :foreign_key => 'team_2_id'

  has_ancestry :cache_depth => true

  scope :ping_pong, -> { where(type: 'PingPong')}
  scope :fuzz_ball, -> { where(type: 'FuzzBall')}

  delegate :pingpong, :fuzzball, to: :games

  after_initialize :init

  def init
    self.team_1_score ||= 0
    self.team_2_score ||= 0
  end

  def set_team(team)
    if !team_1_id.blank? && !team_2_id.blank?
      flash.now[:alert] = "This game already has two teams"
    elsif team_1_id.blank? && team_2_id.blank?
      self.team_1_id = team.id
    elsif !team_1_id.blank? && team_2_id.blank?
      self.team_2_id = team.id
    elsif team_1_id.blank? && !team_2_id.blank?
      self.team_1_id = team.id
    end
    self.save
  end

  def current_game_teams
    first_team = team_1
    second_team = team_2
    "#{first_team.team_name} (#{first_team.player1_name} and #{first_team.player2_name}) vs. #{second_team.team_name} (#{second_team.player1_name} and #{second_team.player2_name})"
  end  

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

  def update_first_team_score
    # @game = Game.find(params[:id])
    new_score = self.update_attribute(:team_1_score, self.team_1_score + 1)

    if self.winner 
      next_game = self.parent
      if next_game.team_1_id == nil
        next_game.team_1_id = self.winner
        binding.pry
      else
        next_game.team_2_id = self.winner
      end
      next_game.save
    end

    
  end

  def update_second_team_score
    @game = Game.find(params[:id])
    new_score = @game.update_attribute(:team_2_score, @game.team_2_score + 1)

    if @game.winner 
      next_game = @game.parent
      if next_game.team_1_id == nil
        next_game.team_1_id = @game.winner.id
      else
        next_game.team_2_id = @game.winnder.id
      end
    end
  end

  def teams
    Team.where("id in (?)", [team_1_id, team_2_id])
  end


end

















