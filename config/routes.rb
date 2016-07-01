Rails.application.routes.draw do
  root :to => "root#show"

  resources :items, only: [:index, :show]
  resources :users, only: [:new, :index, :create]
  resources :cart_items, only: [:create, :index, :destroy, :update]

  resources :orders, only: [:index, :create, :show, :edit, :update]

  resources :vendors, only: [:index, :new, :create, :edit, :update]

  resources :categories, only: [:index, :show]

  namespace :admin do
    get "/dashboard" => "users#show"
  end

  namespace :vendor, path: ':vendor_slug' do
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
  end

  namespace :retired do
    resources :vendors, only: [:index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/search', to: 'search#index'

  patch "/user/edit", to: "users#update"
  get "admin/user/edit" => "users#edit", as: "admin_edit_user"
  get "/user/edit", to: "users#edit", as: "edit_user"
  get "/cart" => "cart_items#index", as: "cart"
  get "/dashboard" => "users#show", as: "dashboard"
  get "/favicon.ico" => "application#get_favicon"
  get "/:vendor_slug", to: "vendors#show", as: "vendor_show"
end
