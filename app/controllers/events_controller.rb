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
      @event.user_events.each do |user_event|
        user_event.update(points: scores_for_users_events(@league.id)[user_event.position.to_s])
      end
      redirect_to events_path(league: params[:event][:league_id])
    else
      flash[:alert] = @event.errors.full_messages
      redirect_to new_event_path(league: params[:event][:league_id])
    end
    rescue ActiveRecord::RecordNotUnique
      flash[:alert] = 'Participantes duplicados'
      redirect_to new_event_path(league: params[:event][:league_id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path(league: params[:league])
  end

  private

  def set_league
    @league = League.find(params[:league])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :date, :track_id, :league_id, user_events_attributes: [:user_id, :position, :points, :status])
  end


  def scores_for_users_events(league_id)
    PositionsTable.where(points_system_id: League.find(league_id).points_system_id).collect { |pt| [pt.position, pt.points] }.to_h
  end
end
