Rails.application.routes.draw do
  namespace :api do
    resources :notifications, only: :create
  end

  root 'home#show'
end
