# frozen_string_literal: true

Rails.application.routes.draw do
  
  get 'run_cleanup', to: 'cleanup#run'

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    get '/start_game', to: 'tries#start_game', as: 'start_game'

    resource :session, only: %i[new create destroy]

    resources :users, only: %i[new create edit update] do
      collection do
        get 'unfinished_games'
        get 'finished_games'
      end
    end

    resources :tries, only: %i[index new create] do
      collection do
        patch 'reorder'
      end
    end

    root 'tries#index'
  end
end
