Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products
  resources :users, only: [:show, :logout] do
    collection do
      get "logout" 
    end
  end
end
