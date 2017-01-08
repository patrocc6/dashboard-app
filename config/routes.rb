Rails.application.routes.draw do
  namespace :admin do
    resources :users
resources :projects
resources :admin_users

    root to: "users#index"
  end

  resources :projects
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'
end
