class League < ApplicationRecord
  validates :description, presence: true
  validates :name, presence: true
end
