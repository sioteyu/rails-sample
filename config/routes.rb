Rails.application.routes.draw do
  get 'test/index'
  root 'static_pages#home'
  resources 'user', only: [:create, :update, :destroy, :edit, :index]
  resources 'posts', only: [:create]
  resources 'friend_request', only: [:create, :index]
  resources 'friends', only: [:index, :destroy]
  get '/about', to: 'static_pages#about'
  get '/login', to: 'session#new'
  get '/signup', to: 'user#signup'
  get '/profile', to: 'user#profile'
  get '/user/search', to: 'user#search'
  get '/user/index'
  post '/signup', to: 'user#create'
  post '/login', to: 'session#create'
  post '/friend_request/accept', to: 'friend_request#accept'
  delete '/logout', to: 'session#destroy'
  delete '/user/delete', 'user#destroy'
  delete '/friend_request/delete', to: 'friend_request#destroy'
end
