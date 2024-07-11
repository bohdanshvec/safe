module CurrentGame
  extend ActiveSupport::Concern
  
  included do

    private

    def current_session_game(game_id)
      session[:current_game_id] = game_id
      current_game
    end

    def current_game
      @current_game = Game.find_by(id: session[:current_game_id])
    end

    def calculation_user_statistics(games)
      @all_games = games.count
      @finished_games = games.where(status: 1).count
      @unfinished_games = games.where(status: 0).count
      @up_to_5_tries_games = games.where(status: 1).select { |game| game.tries.ids.count <= 5}.count
      @to_6_7_tries_games = games.where(status: 1).select { |game| game.tries.ids.count == (6..7) }.count
      @to_8_10_tries_games = games.where(status: 1).select { |game| game.tries.ids.count == (8..10) }.count
      @more_than_10_tries_games = games.where(status: 1).select { |game| game.tries.ids.count > 10 }.count
    end

    helper_method :current_game

  end
end