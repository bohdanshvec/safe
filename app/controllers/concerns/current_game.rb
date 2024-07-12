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

    helper_method :current_game

  end
end