class UserController < ApplicationController
  def index

  end

  def signup
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Successfully created a new user"
      render 'index'
    else
      render 'signup'
    end
  end

  def profile
    if logged_in?
      @user = current_user
      @post = @user.post.new
      @posts = @user.post.all
    else
      flash[:danger] = "Log in first!"
      redirect_to '/login'
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Successfully updated your profile"
      redirect_to '/profile'
    else
      render 'edit'
    end
  end

  def users
    if current_user.isAdmin
      @users = User.all
    else
      flash[:danger] = "Restricted access, Only admins can access this"
      redirect_to '/profile'
    end
  end

  def search
    @users = User.all
  end

  def destroy
    @user = User.find(params[:u_id])
    @user.destroy
    redirect_to '/users/show'
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email, :name, :isAdmin)
    end
end
