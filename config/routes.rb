Rails.application.routes.draw do
  


  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :users

  resources :items do
    resources :join_table_cart_items
  end

  resources :carts do
    resources :items
  end


  resources :orders do
    resources :charges
  end

  resources :join_table_order_items

  root "items#index"


# routes for static_pages :

  get "/contact", to: "static_pages#contact"
  get "/about", to: "static_pages#about"
  get "/use_terms", to: "static_pages#terms_of_use"

end
