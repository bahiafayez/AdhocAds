class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user  #to make it available in the view.. i think an alternative would be to implement it in the application_helper directly..

  private
  
  def current_user
    @current_user ||= OnlineUser.find(session[:user_id]) if session[:user_id]
  end
  
  def after_sign_in_path_for(resource)
    "/ads"
  end
end
