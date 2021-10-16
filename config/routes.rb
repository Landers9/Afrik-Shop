Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :notes
  resources :orders
  resources :carts
  resources :favories
  resources :products
  devise_for :users
  resources :categories
  root to: "pages#home"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
