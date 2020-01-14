Rails.application.routes.draw do
  devise_for :users
  root "products#show"
end
