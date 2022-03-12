class LeagueLikesController < ApplicationController
  before_action :find_league_like, only: [:destroy]
  before_action :find_league, only: [:create]

  def create
    if user_signed_in?
      if already_liked?
        flash[:notice] = "You can't like more than once"
      else
        @league&.league_likes.create(user_id: current_user.id)
      end
      redirect_to leagues_path
    end
  end

  def destroy
    if already_liked?
      @league_like.destroy!
    else
      flash[:notice] = "Cannot unlike"
    end
    redirect_to leagues_path
  end

  private
  def find_league
    @league = League.find(params[:league_id])
  end

  def find_league_like
    @league_like = LeagueLike.find(params[:id])
  end

  def already_liked?
    LeagueLike.where(user_id: current_user.id, league_id: params[:league_id]).exists?
  end
end
