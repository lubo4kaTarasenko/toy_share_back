class ApplicationController < ActionController::Base
  rescue_from ActionController::InvalidAuthenticityToken do |_exception|
    sign_out
  end
end
