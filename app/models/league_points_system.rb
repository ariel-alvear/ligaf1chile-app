class LeaguePointsSystem < ApplicationRecord
  belongs_to :league
  belongs_to :points_system
end
