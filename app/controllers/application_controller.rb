class ApplicationController < ActionController::Base
  protect_from_forgery

  
  before_filter :check_session


  def check_admin
    return true if admin?
    redirect_to root_url
  end



  def check_session 
    return true if current_user
    redirect_to root_url
  end
 
  force_ssl

  private

  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  helper_method :admin?

  def admin?
    if current_user.admin 
      return true
    else 
      return false
    end
  end

end
