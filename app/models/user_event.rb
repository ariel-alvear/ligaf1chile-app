class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def user_name
    self.user.name
  end
end
