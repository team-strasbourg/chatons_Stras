Rails.application.routes.draw do
  


  devise_for :users

  resources :users

  resources :items do
    resources :join_table_cart_items
  end
  resources :carts do 
    resources :items
  end
  
  resources :orders
  resources :join_table_order_items


  root "items#index"

end
