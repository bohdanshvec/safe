class ApplicationController < ActionController::Base
  helper_method :current_code

  def current_code
    current_code = Code.find_by(id: session[:current_code])
  end
end
