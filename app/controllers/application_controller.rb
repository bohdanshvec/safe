class ApplicationController < ActionController::Base
  helper_method :current_code

  def current_code
    current_code = Game.find_by(id: session[:current_code])
  end
end
