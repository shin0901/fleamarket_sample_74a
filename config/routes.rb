Rails.application.routes.draw do

  devise_for :users
  get 'products/index'
  get 'searches/index'
  root 'top#index'
  resources :top, only: [:index, :new]
  resources :products, only: [:index, :new, :show, :create]
  resources :users, only: [:index, :show]
end
