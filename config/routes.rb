Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  namespace :api do
    namespace :v1 do
      post '/signup', to: 'users#signup'
      post '/login', to: 'authentication#login'
    end
  end
end
