Rails.application.routes.draw do
  root "entries#index"
 
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get "users/:id", to: "users#show", as: "user"
  post '/users', to: 'users#create'

  resources :users, only: [:new, :create]
  resources :entries
end
