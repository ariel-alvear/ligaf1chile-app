class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @user_events = UserEvent.where(user_id: current_user.id)
  end
end
