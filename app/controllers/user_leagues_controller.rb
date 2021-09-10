# En estos controladores se manejan las ligas
class UserLeaguesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_league, only: [:show, :edit, :update]

  def index
    @user_leagues = UserLeague.where(league_id: params[:league])
  end

  def new
    @users = User.all
    @user_league = UserLeague.new
  end

  def create
    params[:users_ids].each do |id|
      UserLeague.create(user_id: id.to_i, league_id: params[:user_league][:league_id])
    end
    redirect_to user_leagues_path(league: params[:user_league][:league_id])
  end

  def edit
  end

  def update
    @user_league.update(user_league_params)
    if @user_league.valid?
      redirect_to @user_league
    else
      flash[:errors] = @user_league.errors.full_messages
      redirect_to edit_user_path(@user_league)
    end
  end

  def show
  end

  def destroy
    @user_league.destroy
    redirect_to user_league_path
  end

  private

  def set_user_league
    @user_league = UserLeague.find(params[:id])
  end

  def user_league_params
    params.require(:user_league).permit(:user_id, :league_id, :status, :points)
  end
end
