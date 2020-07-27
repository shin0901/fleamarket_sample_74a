Rails.application.routes.draw do
  get 'products/index'
  get 'searches/index'
  root 'top#index'
end
