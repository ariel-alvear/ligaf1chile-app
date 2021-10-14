module ApplicationHelper
  def users_for_select
    User.all.collect { |user| [user.name, user.id] }
  end
end
