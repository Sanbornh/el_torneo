class UsersController < ApplicationController

  def index
    @games = Game.where('team_1_id IS NOT NULL AND team_2_id IS NOT NULL')
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
    @game.update_first_team_score
    redirect_to user_path


  # respond_to do |format|
  #     format.html { redirect_to user_path }
  #     format.json { render json: @game.team_score }
  #   end
  end

  def update_second_team_score
    @game = Game.find(params[:id])
    @game.update_second_team_score
    redirect_to user_path


  # respond_to do |format|
  #     format.html { redirect_to user_path }
  #     format.json { render json: @game.team_score }
  #   end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
