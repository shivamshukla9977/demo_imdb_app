Rails.application.routes.draw do
  resource :users do
    member do
      get :dashboard
      post :profile
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
   
  resources :movies do
    collection do
      get :search
    end
  end

  resource :reviews, only: [:new, :create, :destroy]

  resource :people

  resources :watchlists

  root 'movies#index'
end