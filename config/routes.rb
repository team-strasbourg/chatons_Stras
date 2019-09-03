Rails.application.routes.draw do
  


  devise_for :users

  resources :users
  resources :items do
    resources :join_table_cart_items
  end
  resources :carts
  resources :orders
  resources :join_table_order_items
  resources :charges


  root "items#index"

end
