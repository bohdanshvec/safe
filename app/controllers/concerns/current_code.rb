module CurrentCode
  extend ActiveSupport::Concern
  
  included do

    private

    def current_session_game(game)
      session[:current_code] = game.id
    end

    def current_code
      @current_code = Game.find_by(id: session[:current_code])
    end

    helper_method :current_code

  end
end