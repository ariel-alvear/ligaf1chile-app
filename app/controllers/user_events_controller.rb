# En estos controladores se manejan los participantes de eventos
class UserEventsController < ApplicationController
  def index
    @user_events = UserEvent.where(event_id: params[:event_id])
    @event = Event.find(params[:event_id])
    @league = League.find(params[:league])
  end

  def new
    @event = Event.find(params[:event_id])
    @user_event = UserEvent.new
    @users = User.all
    @user_events = UserEvent.where(event_id: params[:event_id])
  end

  def create
    @user_ids = params[:user_event][:user_id]
    @user_ids.each do |user_id|
      @event = Event.find(params[:user_event][:event_id])
      @user_event = UserEvent.create!(user_id: user_id, event_id: @event.id)
      flash[:alert] = @user_event.errors.full_messages if @user_event.invalid?
    end
    redirect_to user_events_path(event_id: params[:user_event][:event_id])
  end

  private

  def user_event_params
    params.require(:user_event).permit(:user_id, :event_id)
  end
end
