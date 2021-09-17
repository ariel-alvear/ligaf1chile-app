class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :user_leagues
  has_many :users, through: :user_leagues

  has_many :user_roles
  has_many :roles, through: :user_roles
end
