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

  def user_points(league_id)
    user_league_points  = []
    self.user.user_events.each do |user_event|
      user_league_points << user_event.points if user_event.event.league_id == league_id.to_i
    end
    user_league_points.sum { |e| e.to_i }
  end

  def user_sanctions_points(league_id)
    sanctions_points = []
    self.user.user_events.each do |user_event|
      sanctions_points << user_event.sanctions.pluck(:points_taken).sum if user_event.event.league_id == league_id.to_i
    end
    sanctions_points.sum
  end

  def final_score(league_id)
    self.user_points(league_id) - self.user_sanctions_points(league_id) if self.user_points(league_id)
  end
end
