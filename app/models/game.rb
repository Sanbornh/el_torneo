class Game < ActiveRecord::Base

  has_many :teams_games
  has_many :teams, through: :teams_games

  scope :pingpong, -> { where (type: 'PingPong')}
  scope :fuzzball, -> { where (type: 'FuzzBall')}

end