# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'

  resources :tasks
  resources :products, only: %i[index show]
  resource :cart, only: %i[show update]
  resources :cart_items, only: %i[create update destroy]
  resources :users, only: %i[new create]
  resources :orders, only: %i[index show]

  namespace :admin do
    resources :products
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
