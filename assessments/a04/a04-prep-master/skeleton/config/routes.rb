Links::Application.routes.draw do
  root to: "sessions#new"

  resources :users, only: [:new, :create]
  resources :links
  resource :session, only: [:new, :create, :destroy]
end
