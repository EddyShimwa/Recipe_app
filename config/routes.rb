# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root "foods#index"

  resources :recipe_foods
  resources :recipes
  resources :foods
  resources :users
  resources :public_recipes, only: [:index]
 
  get 'shopping_list', to: 'shopping_list#index'
end
