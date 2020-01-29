Rails.application.routes.draw do
  devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations'
}
  root "products#index"

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
  resources :cards
  
  resources :products do
    member do
      get 'buy', to: 'products#buy'
      post 'confirm', to: 'products#confirm'
      
    end
    collection do
      get 'search'
    end
  end
  #マイページ
  resources :users, only: [:index] do
    member do
      resources :mypage, only: [:index] do
        collection do
          get 'profile'
          post 'profile'
          patch 'profile_edit'
          get 'payment'
          get 'register'
          get 'logout'
          get 'card'
          post 'confirm'
        end
      end
    end
  end
end
