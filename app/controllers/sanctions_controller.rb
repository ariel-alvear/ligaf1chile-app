class SanctionsController < ApplicationController
  def index
    @league = League.find(Event.find(params[:event_id]).league.id)
    @event = Event.find(params[:event_id])
    @sanctions = Sanction.by_event(@event.id)
  end

  def new
    @event = Event.find(params[:event])
    @sanction = Sanction.new
  end

  def create
    @user_event = UserEvent.find(params[:sanction][:user_event_id])
    @event = Event.find(@user_event.event.id)
    @league = @event.league.id
    @sanction = Sanction.create(sanction_params)
    if @sanction.valid?
      redirect_to sanctions_path(event_id: @user_event.event.id)
    else
      flash[:alert] = @sanction.errors.full_messages
      redirect_to new_sanction_path(@event.id)
    end
  end

  private

  def sanction_params
    params.require(:sanction).permit(:description, :points_taken, :videolink, :user_event_id)
  end
end