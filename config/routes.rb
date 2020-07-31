Rails.application.routes.draw do

  get 'products/index'
  get 'searches/index'
  root 'top#index'
  resources :top, only: [:index, :new]
  resources :products, only: [:index, :new, :show]

end
