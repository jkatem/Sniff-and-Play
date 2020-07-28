Rails.application.routes.draw do

  resources :users, only: [:show, :create, :new] do 
    resources :dogs, only: [:new, :show, :index, :edit, :delete]
  end 

  resources :dogs do
    resources :photos, shallow: true #, only: [:new, :create, :show, :index, :edit]
  end

  resources :comments


  root 'homepage#home'

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  delete '/logout', to: 'sessions#destroy'
  
end
