class Game < ActiveRecord::Base

  has_many :teams_games
  has_many :teams, through: :teams_games
  has_ancestry

  scope :ping_pong, -> { where(type: 'PingPong')}
  scope :fuzz_ball, -> { where(type: 'FuzzBall')}

  delegate :pingpong, :fuzzball, to: :games

end