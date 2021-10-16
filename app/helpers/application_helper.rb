module ApplicationHelper
  def users_for_select
    User.all.collect { |user| [user.drivers_name, user.id] }
  end

  def tracks_for_select
    Track.all.collect { |track| ["#{track.country} - #{track.name}", track.id] }
  end
end
