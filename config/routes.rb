Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products,  only: [:index, :new, :create, :edit, :update, :show]
  resources :users, only: [:show]
  resources :signup, only: [:index] do
    collection do
      get 'user_top'
      get 'session1'
      get 'session2'
      get 'session3'
      get 'session4' 
      get 'session5' 
    end
  end
end
