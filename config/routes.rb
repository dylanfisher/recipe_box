Rails.application.routes.draw do

  #
  # Public
  #

  root to: "home#index"

  # Recipes
  get 'recipes',           to: 'recipes#index',       as: 'recipes'
  get 'recipes/:id',       to: 'recipes#show',        as: 'recipe'
  post 'recipes/save/:id', to: 'recipes#save_to_box', as: 'save_to_box'

  # Users
  get 'users',       to: 'users#index',   as: 'users'
  get 'users/:id',   to: 'users#show',    as: 'user'

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

  devise_for :users, path: '', controllers: { registrations: 'users/registrations' },
                               path_names:  { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy'
  end

end
