class Sanction < ApplicationRecord
  belongs_to :user_event

  def self.by_event(event_id)
    self.select { |sanction| sanction.user_event.event_id == event_id.to_i }
  end

  def sanctionated_driver
    self.user_event.user.drivers_name
  end
end
