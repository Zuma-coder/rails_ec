# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'

  resources :tasks
  resources :products, only: %i[index show]

  namespace :admin do
    resources :products
  end
end
