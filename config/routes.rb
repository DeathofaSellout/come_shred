Rails.application.routes.draw do
  devise_for :users
  resources :post_comments
  resources :posts
  resources :conversations do
    resources :messages

    collection do
      get :inbox
      get :all, action: :index
      get :sent
      get :trash
    end
  end

  resources :friendships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  post   '/users',     to: 'users#create',  as: 'users' #adds _path to as
  get    '/users/:id', to: 'users#show',    as: 'user'
  delete '/users/:id', to: 'users#destroy', as: 'destroy'
  patch  '/users/:id', to: 'users#update'

  get '/login',  to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  post '/sessions', to: 'sessions#create'

  post   '/spots',     to: 'spots#create'
  get    '/spots',     to: 'spots#index'
  post   '/spots',     to: 'spots#create'
  get    '/spots/:id', to: 'spots#show',    as: 'spot'
  delete '/spots/:id', to: 'spots#destroy', as: 'destroy_spot'
  patch  '/spots/:id', to: 'spots#update',  as: 'edit_spot'
  get    '/spots/new', to: 'spots#new',     as: 'new_spot'

end
