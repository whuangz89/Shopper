Rails.application.routes.draw do |m|
  root 'shopper#home'

  get 'about', to: "shopper#about"
  get 'seller', to: "shopper#seller"
  get 'join', to: "shopper#join"

  get 'cart', to: "cart#index"
  get 'cart/add/:id', to: "cart#index"
  post 'cart/add/:id', to: "cart#add"

  delete 'cart', to: "cart#destroy"

  devise_for :users

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
    get 'account', to: 'devise/registrations#edit'
  end

  resource :search, only: :show
  resources :products
end

