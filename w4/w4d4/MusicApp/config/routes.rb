Rails.application.routes.draw do
  root to: redirect("/bands")

  resources :users do
    get :activation, on: :collection
    patch '/make_admin' => 'users#make_admin', as: :make_admin
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
