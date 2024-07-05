Rails.application.routes.draw do
  root to: 'lists#index'
  
  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end

  resources :movies, only: [:show] # Ajoutez cette ligne pour les films

  resources :bookmarks, only: [:destroy]
end
