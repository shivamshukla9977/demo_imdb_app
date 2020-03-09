Rails.application.routes.draw do
  
  devise_for :users
   
  resources :movies do
    collection do
      get :search
      get :genre
    end

    resources :reviews
  end

  resources :reviews

  resources :people

  resources :watchlists

  resources :profiles

  root 'movies#index'
end