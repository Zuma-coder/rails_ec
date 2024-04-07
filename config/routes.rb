# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  resources :products, only: [:index, :show]
end
