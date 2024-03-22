class ApplicationController < ActionController::Base
  
  include Authentication
  include CurrentGame

end
