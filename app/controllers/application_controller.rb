class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :current_user
  skip_before_filter :check_session, :only => [:new, :create]

  force_ssl

  private

  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user


end
