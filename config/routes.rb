Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'user#index'

  post  '/users',     to: 'users#create',   as: 'users' #adds _path to as
  get   '/users/:id', to: 'users#show',     as: 'user'
  get   '/users/:id', to: 'users#destroy', as: 'destroy'
  patch '/users/:id', to: 'users#update'

  get '/login',     to: 'sessions#new'
  get '/logout',    to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

  # get  '/posts',    to: 'posts#index'
  # post '/posts',    to: 'posts#create'
end
