Rails.application.routes.draw do
  
  devise_for :users

  resources :users
  resources :items
  resources :carts
  resources :orders


  root "items#index"

end
