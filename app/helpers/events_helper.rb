module EventsHelper
  def users_for_select_event(league_id)
    UserLeague.where(league_id: league_id).collect { |user_league| [user_league.user.drivers_name, user_league.user_id] }
  end
end
