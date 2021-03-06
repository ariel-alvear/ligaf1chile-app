module ApplicationHelper
  def users_for_select
    User.all.collect { |user| [user.drivers_name, user.id] }
  end

  def tracks_for_select
    Track.all.collect { |track| ["#{track.country} - #{track.name}", track.id] }
  end

  def user_events_for_select(event)
    UserEvent.where(event_id: event).collect { |user_event| [user_event.user.drivers_name, user_event.id] }
  end

  def points_system_for_select
    PointsSystem.all.collect { |system| [system.name, system.id] }
  end

  def positions_for_select(league_id)
    PositionsTable.where(points_system_id: League.find(league_id).points_system_id).collect { |pt| pt.position }
  end
end
