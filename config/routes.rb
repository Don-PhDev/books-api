Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :books
      resources :authors

      post '/authenticate', to: 'authentication#create'
    end
  end
end
