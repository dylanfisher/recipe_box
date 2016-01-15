Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  #
  # Public
  #

  root to: "home#index"

  # Recipes
  get 'recipes',          to: 'recipes#index', as: 'recipes'
  get 'recipes/show/:id', to: 'recipes#show',  as: 'recipe'

  # Users
  get 'users/show/:id',   to: 'users#show',    as: 'user'

  #
  # Admin
  #

  # Admin dashboard
  get '/admin', to: 'dashboard#index', as: 'admin'
  namespace :admin do
    resources :color_schemes
    resources :jewels
    resources :recipes
    resources :user_groups
    resources :users
    resources :users
  end

  #
  # Authentication
  #

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
end
