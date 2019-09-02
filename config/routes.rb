Rails.application.routes.draw do
  

  devise_for :users

  resources :users
  resources :items
  resources :carts
  resources :orders
  resources :join_table_cart_items


  root "items#index"

end
