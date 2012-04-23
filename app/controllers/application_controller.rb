class ApplicationController < ActionController::Base
  protect_from_forgery

  @current_user
  
  before_filter :check_session

  def check_session 
    if session[:user_id] ==nil
      redirect_to "/users/new"
    end
  end
 
  force_ssl

  private

  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user


end
