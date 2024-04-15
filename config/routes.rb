# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  resources :products, only: %i[index show]
end
