class League < ApplicationRecord
  has_many :user_leagues
  has_many :users, through: :user_leagues

  validates :description, presence: true
  validates :name, presence: true
end
