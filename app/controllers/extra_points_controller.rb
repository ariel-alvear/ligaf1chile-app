class ExtraPointsController < ApplicationController
  def index
    @league = League.find(Event.find(params[:event_id]).league.id)
    @event = Event.find(params[:event_id])

  end

  def new
    @event = Event.find(params[:event])

  end

  def create
    @user_event = UserEvent.find(params[:extra_point][:user_event_id])
    @event = Event.find(@user_event.event.id)
    @league = @event.league.id

  end

  def destroy
  end

  private

  def extra_points_params
    params.require(:extra_point).permit(:description, :points_given, :user_event_id)
  end
end