class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles, dependent: :destroy

  has_many :user_events
  has_many :events, through: :user_events

  validates :name, presence: true
  validates :last_name, presence: true
  validates :drivers_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :drivers_name, uniqueness: true
end
