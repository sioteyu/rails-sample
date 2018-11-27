class SessionController < ApplicationController
  def create
    user = User.find_by(username: params[:user][:username].downcase)
    if user && user.authenticate(params[:user][:password])
      log_in user
      redirect_to '/profile'
    else
      flash[:danger] = "Invalid username/password"
      render 'new'
    end
  end

  def new
  end

  def destroy
    log_out
    redirect_to '/'
  end
end
