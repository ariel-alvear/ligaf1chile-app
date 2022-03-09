Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :leagues
  resources :user_leagues
  resources :events
  resources :user_events
  resources :sanctions
  resources :extra_points
  resources :points_systems
  resources :positions_tables

  get 'configurations/index'

  root 'leagues#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
