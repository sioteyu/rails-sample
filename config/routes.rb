Rails.application.routes.draw do
  resources 'user'
  resources 'posts'
  get 'user/index'
  root 'user#index'
  get '/login', to: 'session#new'
  get '/signup', to: 'user#signup'
  get '/profile', to: 'user#profile'
  get '/users/show', to: 'user#users'
  post '/signup', to: 'user#create'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  delete '/user/delete', 'user#destroy'
end
