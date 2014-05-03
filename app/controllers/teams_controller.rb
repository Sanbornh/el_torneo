class TeamsController < ApplicationController

  def index
    #wont need because we dont have a page showing all teams
    #could be used to show all teams in the tree
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :score, :player1_name, :player2_name)
  end

end
