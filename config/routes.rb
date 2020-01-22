Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products,  only: [:index, :new, :create, :edit, :update, :show]
  resources :users, only: [:show, :logout] do
    collection do
      get "logout" 
    end
  end
end
