Rails.application.routes.draw do
  root to: 'subs#index'

  resources :users, except: [:index, :show, :destroy]
  resource :session, only: [:new, :create, :destroy]

  resources :subs do
    resources :posts, except: [:index]
  end
end
