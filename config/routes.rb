Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'user#index'

  get    '/user/new', to: 'user#new',    as: 'new_user'
  post   '/user',     to: 'user#create', as: 'users' #adds _path to as
  get    '/user/:id', to: 'user#show',   as: 'user'
  #patch  '/user/:id', to: 'users#update'

  get '/login',     to: 'sessions#new'
  get '/logout',    to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

end
