Rails.application.routes.draw do
  devise_for :users
  root "product_buy#index"
end
