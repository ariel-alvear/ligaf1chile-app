class League < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :user_leagues, dependent: :destroy
  has_many :users, through: :user_leagues
  belongs_to :points_system

  has_many :league_likes, dependent: :destroy

  validates :description, presence: true
  validates :name, presence: true

  accepts_nested_attributes_for :user_leagues, allow_destroy: true

  def league_events
    self.events.count
  end

  def league_participants
    self.users.count
  end
end
