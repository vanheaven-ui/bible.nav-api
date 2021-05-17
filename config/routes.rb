Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/signup', to: 'users#create'
      post '/login', to: 'authentication#create'
      resources :users, only: %i[show] do
        resources :favorites, except: %i[new edit update]
      end
    end
  end
end
