Rails.application.routes.draw do
  get 'movies/show'
  root to: 'lists#index'

  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :bookmarks, only: [:create, :destroy]
  end
  resources :bookmarks, only: [:destroy]
  resources :movies, only: [:index, :show] # est-ce vraiment nécessaire ? 
end
