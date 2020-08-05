Rails.application.routes.draw do

  root 'homepage#home'

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:show, :create, :new] do 
    resources :dogs, only: [:new, :create, :index, :edit, :show, :update]
    resources :dogs, only: [:show] do
      resources :photos, only: [:new, :create, :show, :index]
    end
  end

  resources :photos, only: [:show] do 
    resources :comments, only: [:new, :create, :edit, :destroy, :update]
  end

  delete '/users/:user_id/dogs/:id', :to => 'dogs#destroy', :as => 'user_dog_delete'
  
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
  
 
end
