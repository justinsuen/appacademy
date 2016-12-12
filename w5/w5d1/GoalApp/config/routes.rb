Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new, :create]
end
