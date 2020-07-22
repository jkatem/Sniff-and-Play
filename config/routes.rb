Rails.application.routes.draw do
  resources :comments
  resources :dogs
  resources :photos
  resources :users

  root 'homepage#home'

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  delete '/logout' => 'sessions#destroy'

  get '/users/:id', to: 'users#show'
end
