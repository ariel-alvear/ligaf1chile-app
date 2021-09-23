class EventsController < ApplicationController
  def index
    @events = Event.where(league_id: params[:league])
    @league = League.find(params[:league])
  end
end
