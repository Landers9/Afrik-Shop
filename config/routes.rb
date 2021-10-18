Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :notes
  resources :orders
  resources :carts
  resources :favories
  resources :products
  resources :categories
  root to: "pages#home"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
