Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "pages#home"

  resources :movies, except: [:destroy] do
    resources :reviews, only: [:index, :new, :create]
    collection do
      # makes /movies/whatever comes here:
      get 'top_rated'
      # get 'christopher_nolan'
    end
    member do
      # makes /movies/:id/something
      get 'director'
    end
  end

  resources :reviews, only: [:show, :destroy]
end
