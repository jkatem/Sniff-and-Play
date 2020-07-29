Rails.application.routes.draw do

  resources :users, only: [:show, :create, :new] do 
    resources :dogs, only: [:new, :create, :show, :index, :edit, :deestroy]
  end 

  resources :dogs, only: [:show] do
    # resources :photos, shallow: true #, only: [:new, :create, :show, :index, :edit]
    resources :photos, only: [:new, :create, :show, :index] 

  end

  resources :photos, only: [:show] do 
    resources :comments, only: [:new, :create, :edit, :destroy, :update]
  end

  # maye use singular resources:
    # resource :photo

  # delete '/dogs/:dog_id/photos/:photo_id' => 'photos#destroy', :as => ''
  
  root 'homepage#home'

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  delete '/logout', to: 'sessions#destroy'
  
end
