class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:login][:email])
    if user && user.authenticate(params[:login][:password])
      session[:user_id] = user.id
      session[:zip_code] = user.zip_code if user.zip_code
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = "Email or password is invalid!"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'You have successfully logged out!'
  end
end
