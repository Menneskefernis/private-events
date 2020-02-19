Rails.application.routes.draw do
  root   'users#new'
  post   '/signup',  to: 'users#create'
  get    '/profile', to: 'users#show'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show]
end
