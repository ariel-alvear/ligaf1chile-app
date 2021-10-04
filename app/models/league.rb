class League < ApplicationRecord
  has_many :events

  validates :description, presence: true
  validates :name, presence: true

  def league_participants
    i = 0
    self.events.each do |event|
      i += event.users.count
    end
    i
  end

  def league_events
    self.events.count
  end
end
