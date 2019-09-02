Rails.application.routes.draw do
  
  devise_for :users

  resources :users
  resources :items
  resources :carts

  root "items#index"

end
