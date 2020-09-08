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

  resources :products, only: [:index, :new, :create, :edit, :show] do
    collection do
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
  end

  resources :users, only: [:index, :show]
  resources :users, only: [:index, :show, :destroy]


  # resources :products, only: [:purchase, :pay, :done] do
  #   member do
  #     get 'purchase'
  #     post 'pay'
  #     get 'done'
  #   end
  # end

  resources :credits, except: [:index, :edit, :update] do
    collection do
      get 'regist_done'
      get 'delete_done'
    end
    member do
      get 'buy'
      post 'pay'
    end
  end

  resources :users, only: [:index, :show]
  resources :images, only: [:index, :new, :create] 
end
