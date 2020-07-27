Rails.application.routes.draw do
 
  resources :users, only: [:show, :create, :new] do 
    resources :dogs, only: [:new, :show, :index, :edit]
  end 

  resources :dogs do
    resources :photos, only: [:new, :create, :show, :index, :edit]
  end

  root 'homepage#home'

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
# need nested resources if i want the path to go to creating your dog after signing up?? Do I want this only for when creating dog profile? 

end
