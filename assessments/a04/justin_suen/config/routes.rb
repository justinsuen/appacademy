TweetsApp::Application.routes.draw do
  root to: "sessions#new"
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :tweets, only: [:index, :new, :create, :edit, :update, :show]
  resources :replies, only: [:new, :create, :destroy]
end
