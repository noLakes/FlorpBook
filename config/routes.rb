Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show, :index] do
    resources :friend_requests, only: [:create]
  end
  
  resources :posts do
    resources :likes, only: [:create]
  end

  resources :comments do
    resources :likes, only: [:create]
  end
  
  root "posts#index"
end
