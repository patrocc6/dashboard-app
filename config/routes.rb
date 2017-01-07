Rails.application.routes.draw do
  resources :projects
  devise_for :users
  root to: 'static#homepage'
end
