Rails.application.routes.draw do
  require 'sidekiq/web'
  root 'users#index'
  resources :users
  mount Sidekiq::Web => "/sidekiq"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
