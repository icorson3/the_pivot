Rails.application.routes.draw do
  root :to => "items#index"

  resources :items, only: [:index, :show]
  resources :users, only: [:new, :index, :create]
  resources :cart_items, only: [:create, :index, :destroy, :update]

  resources :orders, only: [:index, :create, :show, :edit, :update]

  resources :vendor, only: [:index]

  namespace :admin do
    get "/dashboard" => "users#show"
  end

  namespace :vendor, path: ':vendor_slug', as: :vendor do
    resources :items, only: [:index, :show]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  patch "/user/edit", to: "users#update"
  get "admin/user/edit" => "users#edit", as: "admin_edit_user"
  get "/user/edit", to: "users#edit", as: "edit_user"
  get "/cart" => "cart_items#index", as: "cart"
  get "/dashboard" => "users#show", as: "dashboard"
  get "/favicon.ico" => "application#get_favicon"
  get "/:vendor_slug", to: "vendor#show", as: "vendor"
  get "/:id" => "categories#show", as: "category"
end
