Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products,  only: [:index, :new, :create, :edit, :update, :show] do
    get 'buy', to: 'products#buy'
  end
  resources :users, only: [:show]
  resources :signup, only: [:index,:create] do
    collection do
      get 'user_top'
      get 'session1'
      get 'session2'
      get 'session3'
      get 'session4' 
      get 'session5' 
    end
  end
  resources :products
  resources :users, only: [:show, :logout] do
    collection do
      get "logout" 
    end
  end
end
