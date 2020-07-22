Rails.application.routes.draw do
  resources :comments
  resources :dogs, except: [:create, :update, :delete]
  resources :photos
  # resources :users

  resources :users do 
    resources :dogs, only: [:new, :show, :index, :edit]
  end 

  root 'homepage#home'

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  delete '/logout' => 'sessions#destroy'

  get '/users/:id/new', to: 'dog#create'

  # get '/users/:id', to: 'users#show'

# need nested resources if i want the path to go to creating your dog after signing up?? Do I want this only for when creating dog profile? 

end
