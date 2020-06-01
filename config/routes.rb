Rails.application.routes.draw do
  
  devise_for :users
   
  resources :movies do
    collection do
      get :search
    end

    member do
      get :movies_by_genre
    end

    resources :reviews
  end

  resources :reviews

  resources :people

  resources :watchlists do
    member do
      get :next
      get :previous
    end
  end

  resources :profiles

  root 'movies#index'
end