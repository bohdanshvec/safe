class ApplicationController < ActionController::Base
  
  include Authentication
  include CurrentGame
  include Internationalization

end
