class ExtraPointsController < ApplicationController
  def index
    @league = League.find(Event.find(params[:event_id]).league.id)
    @event = Event.find(params[:event_id])
    @extra_points = ExtraPoint.by_event(@event.id)
  end

  def new
    @event = Event.find(params[:event])
    @extra_point = ExtraPoint.new
  end

  def create
    @user_event = UserEvent.find(params[:extra_point][:user_event_id])
    @event = Event.find(@user_event.event.id)
    @league = @event.league.id
    @extra_point = ExtraPoint.create(extra_points_params)
    if @extra_point.valid?
      redirect_to extra_points_path(event_id: @user_event.event.id)
    else
      flash[:alert] = @extra_point.errors.full_messages
      redirect_to new_extra_point_path(@event.id)
    end
  end

  def destroy
    @extra_point = ExtraPoint.find(params[:id])
    @extra_point.destroy
    redirect_to extra_points_path(event_id: params[:event_id], league: params[:league])
  end

  private

  def extra_points_params
    params.require(:extra_point).permit(:description, :points_given, :user_event_id)
  end
end