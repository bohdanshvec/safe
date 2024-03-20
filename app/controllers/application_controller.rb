class ApplicationController < ActionController::Base
  
  include Authentication
  include CurrentCode

end
