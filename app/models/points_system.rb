class PointsSystem < ApplicationRecord
  has_many :positions_tables
  has_many :leagues

  accepts_nested_attributes_for :positions_tables, allow_destroy: true
end
