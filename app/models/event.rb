class Event < ApplicationRecord
  belongs_to :track
  belongs_to :league

  def track_name
    Track.find(self.track_id).name
  end

  def track_country
    Track.find(self.track_id).country
  end
end
