Rails.application.routes.draw do

  get 'home/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  resources :users, only: [:show, :index, :edit, :update, :new, :create]

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
   	resource :favorites, only: [:create, :destroy]
    resources :bookcomments, only: [:create, :destroy]
  end

end
