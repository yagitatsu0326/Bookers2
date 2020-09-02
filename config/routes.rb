Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'home/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  resources :users, only: [:show, :index, :edit, :update, :new, :create]
end
