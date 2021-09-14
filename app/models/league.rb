class League < ApplicationRecord
  has_many :user_leagues
  has_many :users, through: :user_leagues

  validates :participants, presence: true
  validates :participants, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :name, presence: true
  validates :admins, presence: true
end
