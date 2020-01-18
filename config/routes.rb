Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products,  only: [:index, :new, :create, :edit, :update, :show]
  resources :signup, only: [:index] do
    collection do
      get 'session1'
      get 'session2'
      get 'session3'
      get 'session4' # ここで、入力の全てが終了する
      get 'session5' # 登録完了後のページ
    end
  end
end
