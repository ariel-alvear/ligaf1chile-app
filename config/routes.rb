Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :leagues
  resources :user_leagues
  resources :events

  root 'leagues#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
