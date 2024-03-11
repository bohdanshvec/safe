Rails.application.routes.draw do

  get '/start_game', to: 'tries#start_game', as: 'start_game'

  resources :tries, only: [:index, :new, :create]

  root 'tries#index'
end
