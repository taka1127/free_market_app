Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :signup, only: [:index,:create] do
    collection do
      get 'user_top'
      get 'session1'
      get 'session2'
      get 'session3'
      get 'session4' # ここで、入力の全てが終了する
      get 'session5' # 登録完了後のページ
    end
  end
  resources :products
  resources :users, only: [:show, :logout] do
    collection do
      get "logout" 
    end
  end
end
