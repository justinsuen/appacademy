Rails.application.routes.draw do
  namespace :api do
    get 'todo/show'
  end

  namespace :api do
    get 'todo/index'
  end

  namespace :api do
    get 'todo/create'
  end

  namespace :api do
    get 'todo/update'
  end

  namespace :api do
    get 'todo/destroy'
  end

  namespace :api do
    get 'todo_controller/show'
  end

  namespace :api do
    get 'todo_controller/index'
  end

  namespace :api do
    get 'todo_controller/create'
  end

  namespace :api do
    get 'todo_controller/update'
  end

  namespace :api do
    get 'todo_controller/destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
