# En estos controladores se manejan las ligas
class LeaguesController < ApplicationController
  before_action :set_league, only: [:show, :edit]

  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end

  def create
    @league = League.create(league_params)
    if @league.valid?
      redirect_to @league
    else
      flash[:errors] = @league.errors.full_messages
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
      flash[:errors] = @league.errors.full_messages
      redirect_to edit_user_path(@league)
    end
  end

  def show
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
    params.require(:league).permit(:name, :description, :participants, :admins)
  end
end
