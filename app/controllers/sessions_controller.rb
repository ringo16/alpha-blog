class SessionsController < ApplicationController

  def new

  end

  def create
    #render 'new'
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # saves user.id into variable user_id in session cache
      session[:user_id] = user.id
      flash[:success] = "You are successfully logged in"
      # redirects to users index and pass in user we got from DB
      redirect_to user_path(user)
    else
      # flash.now will not persist onto other pages
      flash.now[:danger] = "There was something wrong with your email information"
      # will render new again
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end