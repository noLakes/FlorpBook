Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show]
  resources :posts
  resources :comments
  resources :likes, only: [:create]
  
  root "posts#index"
end
