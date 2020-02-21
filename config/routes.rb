Rails.application.routes.draw do
  resource :users do
    member do
      get :dashboard
      post :profile
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
   
  resources :movies

  root 'welcomes#index'
end