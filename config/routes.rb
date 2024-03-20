Rails.application.routes.draw do

  get '/start_game', to: 'tries#start_game', as: 'start_game'

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :edit, :update]

  resources :tries, only: [:index, :new, :create]

  root 'tries#index'
end
