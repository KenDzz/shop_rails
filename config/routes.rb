Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'admin/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  resources :orders
  resources :line_items
  resources :carts
  root to: "products#index"
  get 'ordercomplete' => 'header#header'
  get 'payment' => 'orders#new'
  resources :products
  get 'index/index'

  get 'admin' => 'admin#index'
  get 'carts' => 'carts#show'
  
  controller :sessions do
      get 'login' => :new
      post 'login' => :create
      delete 'logout' => :destroy
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
