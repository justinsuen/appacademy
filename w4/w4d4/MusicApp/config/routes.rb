Rails.application.routes.draw do
  root to: redirect("/bands")

  resources :users, only: [:new, :create, :show] do
    get :activation, on: :collection
  end
  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, except: [:index, :new] do
    resources :tracks, only: [:new]
  end

  resources :tracks, except: [:index, :new]

  resources :notes, only: [:create, :destroy]
end
