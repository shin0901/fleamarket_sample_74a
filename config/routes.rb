Rails.application.routes.draw do

  devise_for :users, controller: {
    registraitons: 'users/registrations',
    sessions:      'users/sessions',
  }
  
  get 'searches/index'
  root to: 'top#index'
  resources :top, only: [:index, :new]
  resources :products, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :show]
  resources :images, only: [:new, :create] 
end
