Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    get '/start_game', to: 'tries#start_game', as: 'start_game'

    resource :session, only: [:new, :create, :destroy]

    resources :users, only: [:new, :create, :edit, :update] do
      collection do
        get 'unfinished_games'
        get 'finished_games'
      end
    end

    resources :tries, only: [:index, :new, :create]

    root 'tries#index'
  end
end
