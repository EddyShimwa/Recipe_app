# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root "users#index"

  resources :recipe_foods
  resources :recipes
  resources :foods
  resources :users
end
