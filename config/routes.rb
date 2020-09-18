Rails.application.routes.draw do
  resources :attendances, except: [:edit, :destroy, :update]
  resources :events, except: [:edit, :destroy, :update]
  resources :users, except: [:edit, :destroy, :update]
  root to: 'users#index'

  resources :user_sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'login' => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'
  get '/attend/:event_id', to: 'attendances#attend'
end
