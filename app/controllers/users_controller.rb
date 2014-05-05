class UsersController < ApplicationController

  def index
    #this is to show every game that has been created
    #clicking on a game takes you to the 'show' page for that game
    #the referee should be able to see the games by 'type'
    #need two referees, each responsible for one 'type' of games - fuzzball or pingpong
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
