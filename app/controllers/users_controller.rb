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

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
