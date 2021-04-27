Rails.application.routes.draw do
  
  root 'home#index'

  namespace :api do
    namespace :v1 do
      post '/signup', to: 'users#signup'
      post '/login', to: 'authentication#login'
    end
  end
end
