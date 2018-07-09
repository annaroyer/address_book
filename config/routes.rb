Rails.application.routes.draw do
  root 'home#index'

  namespace :search do
    resources :companies, only: [:index]
  end

  resources :companies, only: [:show, :create ], param: :number
end
