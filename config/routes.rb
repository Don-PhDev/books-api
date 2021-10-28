Rails.application.routes.draw do
  devise_for :users

  resources :books
  resources :authors

  post '/authenticate', to: 'authentication#create'
end
