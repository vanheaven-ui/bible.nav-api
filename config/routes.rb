Rails.application.routes.draw do

  root 'home#index'

  namespace :api do
    namespace :v1 do
      post '/signup', to: 'users#signup'
      post '/login', to: 'authentication#login'
      resources :users, only: %i[show] do
        resources :favorites, only: %i[create show index destroy]
      end
    end
  end
end
