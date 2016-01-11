Rails.application.routes.draw do

  root to: "home#index"

  get 'recipes/index'
  get 'recipes/show/:id', to: 'recipes#show', as: 'recipe'

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

  # Authentication
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

end
