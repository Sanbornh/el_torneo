class UsersController < ApplicationController

  def index
    #this is to show every unplayed game
    #two referees see two separate types of games
    @games = Game.all
  end

  def show
    #the referee can update the score on this page
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

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
