Rails.application.routes.draw do
  
  devise_for :users

  resources :users  do
    member do
      get :dashboard
    end
  end
  #resources :sessions, only: [:new, :create, :destroy]
   
  resources :movies do
    collection do
      get :search
    end

     resources :reviews
  end

  resources :reviews

  resource :people

  resources :watchlists

  root 'movies#index'
end