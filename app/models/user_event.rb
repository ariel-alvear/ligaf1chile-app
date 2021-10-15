class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  before_save :check_for_identical_record

  def user_name
    self.user.name
  end

  def user_last_name
    self.user.last_name
  end

  def user_driver_name
    self.user.drivers_name
  end

  def check_for_identical_record
    if UserEvent.exists?(user_id: self.user_id, event_id: self.event_id)
      raise Exception.new('Participantes duplicados!')
    else
      true
    end
  end
end
