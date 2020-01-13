Rails.application.routes.draw do
  devise_for :users
  # root "products#index"
  root to: "users/new"
end
