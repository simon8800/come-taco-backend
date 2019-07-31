# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      resources :orders
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/get_items', to: 'users#get_items'
      resources :items
      resources :charges
    end
  end
end
