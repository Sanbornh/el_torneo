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
    new_score = @game.update_attribute(:team_1_score, @game.team_1_score + 1)
    redirect_to user_path

    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def update_second_team_score
    @game = Game.find(params[:id])
    new_score = @game.update_attribute(:team_2_score, @game.team_2_score + 1)
    redirect_to user_path

    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
