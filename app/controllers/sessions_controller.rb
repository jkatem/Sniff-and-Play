class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
        session[:user_id] = user.id
        flash[:msg] = "Logged in successfully"
        redirect_to user_path(user)
    else 
      redirect_to login_path 
    end
  end

  def destroy
      session.delete(:user_id)
      flash[:notice] = "You have successfully logged out."
      redirect_to '/'
  end

  def omniauth 
    # byebug
    @user = User.from_omniauth(auth) # method called is from our user model 
    
    session[:user_id] = user.id
    redirect_to login_path(user) 
  end

  private
  def auth
    request.env['omniauth.auth']
  end

  def session_params
    params.require('session').permit(:email, :password)
  end

end