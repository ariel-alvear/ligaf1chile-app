class ExtraPoint < ApplicationRecord
  belongs_to :user_event

  validates :description, presence: true
  validates :points_given, presence: true

  def self.by_event(event_id)
    self.select { |extra_point| extra_point.user_event.event_id == event_id.to_i }
  end

  def extrapointed_driver
    self.user_event.user.drivers_name
  end
end
