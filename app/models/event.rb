class Event < ApplicationRecord
  belongs_to :track
  belongs_to :league


  has_many :user_events
  has_many :events, through: :user_events

  def track_name
    Track.find(self.track_id).name
  end

  def track_country
    Track.find(self.track_id).country
  end
end
