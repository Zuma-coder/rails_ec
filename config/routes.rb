# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'

  resources :tasks
  resources :products, only: %i[index show]
  resource :carts, only: %i[show]
  resources :cart_items, only: %i[create update destroy]

  namespace :admin do
    resources :products
  end
end
