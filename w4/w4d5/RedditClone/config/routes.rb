Rails.application.routes.draw do
  # root to: "/subs"

  resources :users, except: [:index, :destroy]
  resource :session
end
