Rails.application.routes.draw do

  # Authentication
  devise_for :users

  root to: "home#index"

end
