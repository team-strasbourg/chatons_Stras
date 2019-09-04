Rails.application.routes.draw do

  get 'avatars/new'
  get 'avatars/create'
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

  root :to => "items#index"
  namespace :admin do
    root :to =>"users#index"
    resources :users
    resources :items do
      resources :avatars, only: [:create, :new]
    end
    resources :orders
  end




# routes for static_pages :

  get "/contact", to: "static_pages#contact", :as => 'contact'
  get "/about", to: "static_pages#about", :as => 'about'
  get "/use_terms", to: "static_pages#terms_of_use", :as => 'use_terms'

  get '/profile',    to: 'users#show'

end
