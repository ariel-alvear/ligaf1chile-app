class EventsController < ApplicationController
  before_action :set_league, only: [:index, :new]
  before_action :set_event, only: [:show, :edit, :update]


  def index
    @events = Event.where(league_id: params[:league])
  end

  def new
    @event = Event.new
    @tracks = Track.all
  end

  def create
    @league = League.find(params[:event][:league_id])
    @event = Event.create(event_params)
    if @event.valid?
      redirect_to events_path(league: params[:event][:league_id])
    else
      flash[:alert] = @event.errors.full_messages
      redirect_to new_event_path(league: params[:event][:league_id])
    end
  end

  private

  def set_league
    @league = League.find(params[:league])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:date, :track_id, :league_id, user_events_attributes: [:user_id, :points, :position])
  end
end
