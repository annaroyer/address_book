Rails.application.routes.draw do
  root 'home#index'

  namespace :search do
    resources :companies, only: [:index]
  end
end
