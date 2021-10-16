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

  def user_events
    self.user.user_events.count
  end

  def user_points
    self.user.events.pluck(:points).sum
  end

  def check_for_identical_record
    if UserLeague.exists?(user_id: self.user_id, league_id: self.league_id)
      raise Exception.new('Participantes duplicados!')
    else
      true
    end
  end
end
