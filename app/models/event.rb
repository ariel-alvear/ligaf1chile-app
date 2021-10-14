class Event < ApplicationRecord
  belongs_to :track
  belongs_to :league

  has_many :user_events
  has_many :users, through: :user_events

  accepts_nested_attributes_for :user_events, allow_destroy: true

  def track_name
    Track.find(self.track_id).name
  end

  def track_country
    Track.find(self.track_id).country
  end

  def participant_number
    self.user_events.count
  end
end
