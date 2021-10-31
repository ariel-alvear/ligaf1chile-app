class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :sanctions

  def user_name
    self.user.name
  end

  def user_last_name
    self.user.last_name
  end

  def user_driver_name
    self.user.drivers_name
  end

  def sanctions_points
    self.sanctions.pluck(:points_taken).sum { |e| e.to_i }
  end

  def final_score
    self.points - self.sanctions_points if self.points
  end
end
