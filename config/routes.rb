Rails.application.routes.draw do
  resources :events
  resources :users
  root to: 'users#index'

  resources :user_sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'login' => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'

end
