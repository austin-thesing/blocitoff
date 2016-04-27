Rails.application.routes.draw do
  devise_for :users

  root to: 'users#root_redirect' # => redirects to the profile of the user who is signing in to Blocitoff

  resources :users, only: [:show] do
    resources :items, only: [:create]
  end
end
