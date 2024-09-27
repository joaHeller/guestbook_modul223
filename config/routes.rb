Rails.application.routes.draw do
  root "entries#index"
 
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'users/:id/logout_redirect', to: 'users#logout_redirect', as: 'logout_redirect'
  delete '/logout', to: 'sessions#destroy'
 


  resources :users, only: [:show, :update, :edit]
  resources :entries
end
