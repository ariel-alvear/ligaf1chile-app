class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  [:superadmin, :admin, :participant_admin, :participant, :normal].each do |role|
    define_method("#{role}?") { roles.exists?(name: role) }
  end
end
