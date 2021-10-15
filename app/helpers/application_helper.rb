module ApplicationHelper
  def users_for_select
    User.all.collect { |user| [user.drivers_name, user.id] }
  end
end
