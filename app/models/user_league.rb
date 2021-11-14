class UserLeague < ApplicationRecord
  belongs_to :user
  belongs_to :league

  def user_name
    self.user.name
  end

  def user_last_name
    self.user.last_name
  end

  def user_driver_name
    self.user.drivers_name
  end

  def user_events(league_id)
    events_from_league = []
    self.user.user_events.each do |user_event|
      events_from_league << user_event.event.league.id if user_event.event.league.id == league_id.to_i
    end
    events_from_league.count
  end

  def user_sanctions_points(league_id)
    sanctions_points = []
    self.user.user_events.each do |user_event|
      sanctions_points << user_event.sanctions.pluck(:points_taken).sum if user_event.event.league_id == league_id.to_i
    end
    sanctions_points.sum
  end

  def user_extra_points(league_id)
    user_extra_points = []
    self.user.user_events.each do |user_event|
      user_extra_points << user_event.extra_points.pluck(:points_given).sum if user_event.event.league_id == league_id.to_i
    end
    user_extra_points.sum
  end

  def user_preliminary_points(league_id)
    league_events_points = []
    self.user.user_events.each do |user_event|
      if user_event.event.league.id == league_id.to_i && user_event.points 
        league_events_points << user_event.points
      end
    end
    league_events_points.sum
  end

  def user_total_points(league_id)
    total_points = []
    total_points << self.user_preliminary_points(league_id)
    total_points << "-#{self.user_sanctions_points(league_id)}".to_i if self.user_sanctions_points(league_id) > 0
    total_points << self.user_extra_points(league_id) if self.user_extra_points(league_id) > 0
    total_points.sum
  end
end
