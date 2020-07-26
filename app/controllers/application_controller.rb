class ApplicationController < ActionController::Base
  # before_action :require_login

  helper_method :current_user
  helper_method :logged_in?

 private
 
 # Finds the User with the ID stored in the session with the key
 # :current_user_id This is a common way to handle user login in
 # a Rails application; logging in sets the session value and
 # logging out removes it.

  # def current_user
  #   @current_user ||= session[:current_user_id] &&
  #     User.find_by(id: session[:current_user_id])
  # end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in"
      redirect_to '/'
    end
  end

  def logged_in?
    !!current_user 
  end

  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
 end

end
