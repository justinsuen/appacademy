Rails.application.routes.draw do
  root to: 'users#new'

  resources :users, except: [:index, :show, :destroy]
  resource :session, only: [:new, :create, :destroy]
end
