Rails.application.routes.draw do
  resource :users do
    member do
      get :dashboard
      post :profile
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
   
  resources :movies do
    member do
      get :review
      get :cast
    end
  end

  resources :searches do
    collection do
      get :search
    end
  end

  resource :reviews, only: [:new, :create, :destroy]

  root 'welcomes#index'
end