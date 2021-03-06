Rails.application.routes.draw do

  #
  # Public
  #

  get '/soon', to: 'holding_pages#show', as: 'holding_page'

  root to: "home#index"

  # Recipes
  resources :recipes
  post '/recipes/save/:id', to: 'recipes#save_to_box', as: 'save_to_box'
  # get 'recipes', to: 'recipes#index', as: 'recipes'
  # get 'recipes/:id', to: 'recipes#show', as: 'recipe'

  # Users
  get   '/users', to: 'users#index', as: 'users'
  get   '/users/:id', to: 'users#show', as: 'user'
  patch '/users/:id', to: 'users#update'
  get   '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  get   '/users/:id/recipes/edit', to: 'users#edit_recipes', as: 'edit_user_recipes'
  get   '/users/:id/saved-recipes/edit', to: 'users#edit_saved_recipes', as: 'edit_user_saved_recipes'

  # Blog / Tumblr feed
  get '/mmmbox', to: 'blog#mmmbox', as: 'tumblr'

  # About
  get '/about', to: 'about#index'
  get '/about/statement', to: 'about#statement'

  # Search
  get 'search', to: 'search#index'


  #
  # Admin
  #

  # Admin dashboard
  get '/admin', to: 'dashboard#index', as: 'admin'
  namespace :admin do
    resources :color_schemes
    resources :jewels
    resources :user_groups
    resources :users
  end


  #
  # Authentication
  #

  get '/signup/confirm/:id', to: 'users#confirm', as: 'confirm_user_registration'
  patch '/signup/confirm/:id', to: 'users#confirm_update'

  devise_for :users, path: '', controllers: { registrations: 'users/registrations' },
                               path_names:  { sign_in: '/login', sign_out: '/logout', sign_up: '/signup' }
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
  end

end
