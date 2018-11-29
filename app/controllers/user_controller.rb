class UserController < ApplicationController
  before_action :is_admin, only: [:index]
  before_action :user_logged_in, only: [:profile, :edit, :update, :search, :destroy]
  def index
    @users = User.all
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Successfully created a new user"
      redirect_to '/'
    else
      render 'signup'
    end
  end

  def profile
    @user = current_user
    @post = @user.post.new
    @posts = @user.post.all
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

  def search
    @users = User.all
    @friend = Friend.all
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

    def is_admin
      unless current_user.isAdmin
        flash[:danger] = "Restricted access, Only admins can access this"
        redirect_to '/profile'
      end
    end

    def user_logged_in
      unless logged_in?
        flash[:danger] = "Please login first"
        redirect_to '/login'
      end
    end
end
