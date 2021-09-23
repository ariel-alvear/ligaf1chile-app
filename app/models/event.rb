class Event < ApplicationRecord
  belongs_to :track
  belongs_to :user
  belongs_to :league
end
