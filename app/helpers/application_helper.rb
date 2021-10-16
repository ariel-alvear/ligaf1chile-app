module ApplicationHelper
  def users_for_select
    User.all.collect { |user| [user.drivers_name, user.id] }
  end

  def tracks_for_select
    Track.all.collect { |track| ["#{track.country} - #{track.name}", track.id] }
  end

  def user_events_for_select(event)
    UserEvent.where(event_id: event).collect { |user_event| [user_event.user.name, user_event.id] }
  end
end
