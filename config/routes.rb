Rails.application.routes.draw do
  
  devise_for :users
   
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