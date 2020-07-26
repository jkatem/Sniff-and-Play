Rails.application.routes.draw do
  resources :comments
  # resources :dogs, except: [:create, :update, :delete]

  # do i do a nested resource with dogs and photos? Can I?
  resources :photos

 
  resources :users, only: [:show, :create, :new] do 
    resources :dogs, only: [:new, :show, :index, :edit]
  end 

  resources :dogs do
    resources :photos, only: [:new, :show]
  end

  root 'homepage#home'

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  delete '/logout', to: 'sessions#destroy'
  
  # get 'users/:id/dogs/:id', to: 'dogs#show'




# need nested resources if i want the path to go to creating your dog after signing up?? Do I want this only for when creating dog profile? 

end
