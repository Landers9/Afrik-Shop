Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show]
  resources :notes
  resources :orders
  resources :carts
  get '/add_cart/:id', to: 'carts#create', as: 'add_cart'
  get '/checkout', to: 'checkouts#checkout', as: 'checkout'
  get '/add_favory/:id', to: 'favories#create', as: 'add_favory'
  get '/delete_cart/:id', to: 'carts#destroy', as: 'delete_cart'
  get '/delete_favory/:id', to: 'favories#destroy', as: 'delete_favory'
  get '/delete_order/:id', to: 'orders#destroy', as: 'delete_order'
  get '/add_order/:indice', to: 'orders#create', as: 'add_order'
  # get '/profil/:id', to: 'users#show', as: 'profil'
  resources :favories
  resources :products
  resources :categories
  root to: "pages#home"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
