Rails.application.routes.draw do

  get '/start_game', to: 'games#start_game', as: 'start_game'

  resources :games, only: [:index, :new, :create]

  root 'games#index'
end
