Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :instruments
  resources :charges
  devise_for :users
  root 'instruments#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
