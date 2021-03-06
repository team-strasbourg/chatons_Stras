Rails.application.routes.draw do

  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
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

  root :to => "static_pages#welcome_page"


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

end
