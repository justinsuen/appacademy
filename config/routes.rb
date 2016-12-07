NinetyNineCatsDay1::Application.routes.draw do
  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:create, :new] do
    post "approve", on: :member
    post "deny", on: :member
  end
  resources :users, only: [:create, :new, :show]
  resources :sessions, only: [:new, :create, :destroy]

  root to: redirect("/cats")
end
