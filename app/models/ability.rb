# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    # checkeamos si hay un super admin
    if user.roles.where(id: 1).any?
      can :manage, :all
    else
      can :read, :all
    end
  end
end
