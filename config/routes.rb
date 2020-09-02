Rails.application.routes.draw do

  devise_for :credits
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  get 'searches/index'
  root to: 'top#index'
  resources :top, only: [:index, :new]
  resources :products, only: [:index, :new, :create, :edit, :show]
  resources :users, only: [:index, :show, :destroy]
  resources :images, only: [:new, :create] 
end
