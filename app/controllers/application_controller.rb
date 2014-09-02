class ApplicationController < ActionController::Base
  protect_from_forgery

  add_flash_types :success

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username = "honey pie" && password == "hunpie"
    end
  end

end
