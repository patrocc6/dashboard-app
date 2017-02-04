Rails.application.routes.draw do

  namespace :admin do
    resources :users
    resources :projects
    resources :admin_users
    root to: "users#index"
  end

  resources :projects do
    resources :phases
  end

  resources :tasks

  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'
end
