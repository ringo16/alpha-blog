class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # helper_method will allow the following methods 
  # to be used by views
  helper_method :current_user, :logged_in?
  def current_user
    # return @current_user if exist 
    # else
    # return user if session[:user_id] exist
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # !! means boolen
    # return if curerent_user is not nil
    !!current_user
  end

  def require_user
    # if not logged in, display msg and redirect to root
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
