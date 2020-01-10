Rails.application.routes.draw do
  devise_for :users
  # root to:"samples#index"
  root "products#index"
end
