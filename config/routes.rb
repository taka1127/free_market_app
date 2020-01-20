Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products,  only: [:index, :new, :create, :edit, :update, :show] do
    get 'buy', to: 'products#buy'
  end
  resources :users, only: [:show]
end
