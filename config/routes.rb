Rails.application.routes.draw do

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :users do
    resources :carts do
      resources :items
    end
    
    resources :orders do
      resources :charges
    end
  end

  resources :items do
    resources :join_table_cart_items
  end

  resources :join_table_order_items

  namespace :admin do
    resources :users
    resources :items
    resources :orders
  end

  root "items#index"

end
