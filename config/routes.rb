Rails.application.routes.draw do

  namespace :admin do
    resources :color_schemes
  end
  namespace :admin do
    resources :jewels
  end
  namespace :admin do
    resources :recipes
  end
  namespace :admin do
    resources :users
  end
  root to: "home#index"

  # Admin dashboard
  get '/admin', to: 'dashboard#index', as: 'admin'
  namespace :admin do
    resources :user_groups
    resources :users
  end

  # Authentication
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

end
