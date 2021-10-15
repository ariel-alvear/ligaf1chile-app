class League < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :user_leagues, dependent: :destroy
  has_many :users, through: :user_leagues

  validates :description, presence: true
  validates :name, presence: true

  accepts_nested_attributes_for :user_leagues, allow_destroy: true

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
