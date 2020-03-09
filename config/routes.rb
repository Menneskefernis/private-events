Rails.application.routes.draw do
  get    'invitations/show'
  root   'events#index'
  post   '/signup',       to: 'users#create'
  get    '/profile',      to: 'users#show'
  get    '/login',        to: 'sessions#new'
  post   '/login',        to: 'sessions#create'
  delete '/logout',       to: 'sessions#destroy'
  resources :users,       only: [:new, :create, :show]
  resources :events,      only: [:index, :create, :show]
  resources :invitations, only: [:show, :create]
end
