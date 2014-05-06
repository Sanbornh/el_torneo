class UsersController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
    end
  end

  def update_first_team_score
    @game = Game.find(params[:id])
    @team_games = TeamsGame.where(game_id: @game.id)
    new_score = @team_games[0].update_attribute(:score, @team_games[0].score + 1)
    redirect_to user_path
  end

  def update_second_team_score
    @game = Game.find(params[:id])
    @team_games = TeamsGame.where(game_id: @game.id)
    @team_games[1].update_attribute(:score, @team_games[1].score + 1)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
