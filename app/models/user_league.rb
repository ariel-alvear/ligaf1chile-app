class UserLeague < ApplicationRecord
  belongs_to :user
  belongs_to :league

  before_create :check_for_identical_record

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
      events_from_league << user_event.event.league.id if user_event.event.league.id == league_id
    end
    events_from_league.count
  end

  def user_points
    self.user.events.pluck(:points).sum
  end

  def user_sanctions_points
    sanctions_points = []
    self.user.user_events.each do |user_event|
      sanctions_points << user_event.sanctions.pluck(:points_taken).sum
    end
    sanctions_points.sum
  end

  def check_for_identical_record
    if UserLeague.exists?(user_id: self.user_id, league_id: self.league_id)
      raise Exception.new('Participantes duplicados!')
    else
      true
    end
  end
end
