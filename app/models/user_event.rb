class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  before_save :check_for_identical_record

  def user_name
    self.user.name
  end

  def check_for_identical_record
    if UserEvent.exists?(user_id: self.user_id, event_id: self.event_id)
      raise Exception.new('Participantes duplicados!')
    else
      true
    end
  end
end
