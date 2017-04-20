Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "books#index"

  resources :users
  resources :books


  resources :genres do
    get '/books', to: 'books#index'
    # resources :books, only: [:index]
    # two ways to get the same nested route
  end

  post 'books/:id/buy', to: 'books#buy', as: 'buy'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
