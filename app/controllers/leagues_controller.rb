# En estos controladores se manejan las ligas
class LeaguesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_league, only: [:show, :edit, :update]
  load_and_authorize_resource

  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end

  def create
    @user = current_user
    @league = League.create(league_params)
    @league.update(created_by: @user.drivers_name)
    if @league.valid?
      redirect_to @league
    else
      flash[:alert] = @league.errors.full_messages
      redirect_to new_league_path
    end
  end

  def edit
  end

  def update
    @league.update(league_params)
    if @league.valid?
      redirect_to @league
    else
      flash[:alert] = @league.errors.full_messages
      redirect_to edit_user_path(@league)
    end
  end

  def show
    @user_leagues = UserLeague.where(league_id: params[:id])
    @user_leagues.each do |user_league|
      user_league.update(points: user_league.user_points(params[:id]))
    end
    @user_leagues = @user_leagues.order("points DESC")
  end

  def destroy
    @league.destroy
    redirect_to league_path
  end

  private

  def set_league
    @league = League.find(params[:id])
  end

  def league_params
    params.require(:league).permit(:name, :description, user_leagues_attributes: [:user_id])
  end
end
