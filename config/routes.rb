Rails.application.routes.draw do

  get 'products/index'
  get 'searches/index'
  root 'top#index'
  # root 'users#payment'
  resources :top, only: [:index, :new]
  resources :products, only: [:index, :new, :show]
  resources :users, only: [:index, :new]

end
