Rails.application.routes.draw do
  


  devise_for :users

  resources :users
  resources :items
  resources :carts
  resources :orders
  resources :join_table_cart_items
  resources :join_table_order_items


  root "items#index"

end
