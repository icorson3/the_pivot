Rails.application.routes.draw do
  root :to => "root#show"
  get '/about', to: "root#index", as: "about"

  resources :items, only: [:index]

  resources :users, only: [:new, :create, :edit, :update]
  get "/dashboard" => "users#show", as: "dashboard"

  resources :cart_items, only: [:create, :index, :destroy, :update]

  resources :orders, only: [:index, :create, :show, :update]

  resources :vendors, only: [:index, :new, :create, :edit, :update]


  resources :categories, only: [:index, :show]

  namespace :admin do
    get "/dashboard" => "users#show"
  end

  namespace :vendor, path: ':vendor_slug' do
    resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :reviews
    resources :orders, only: [:index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/search', to: 'search#index'

  get "admin/user/edit" => "users#edit", as: "admin_edit_user"
  get "/cart" => "cart_items#index", as: "cart"
  get "/favicon.ico" => "application#get_favicon"
  get "/retired/vendors", to: "vendors#retired_index", as: "retired_vendors"
  get "/:vendor_slug", to: "vendors#show", as: "vendor_show"
end
