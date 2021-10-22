Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :notes
  resources :orders
  resources :carts
  get '/add_cart/:id', to: 'carts#create', as: 'add_cart'
  get '/delete_cart/:id', to: 'carts#destroy', as: 'delete_cart'
  get '/delete_order/:id', to: 'orders#destroy', as: 'delete_order'
  get '/add_order', to: 'orders#create', as: 'add_order'
  resources :favories
  resources :products
  resources :categories
  root to: "pages#home"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
