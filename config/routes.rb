Rails.application.routes.draw do
  resources :projects
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'
end
