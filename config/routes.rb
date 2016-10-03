Rails.application.routes.draw do
  get 'events/new'

  get 'events/create'

  get 'events/show'

  get 'events/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'users/new'

  get 'users/create'

  get 'users/show'

  root 'static_pages#home'

  get   '/login',  to: 'sessions#new'
  post   'login',	   to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
end
