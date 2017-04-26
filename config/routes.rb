Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "books#index"

  resources :users
  resources :books

  get '/auth/:provider/callback', to: 'users#auth_callback', as: 'auth_callback'
end
