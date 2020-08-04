class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user 
  end


  def record_not_found(err)
    redirect_to :root, notice: err
  end
end
