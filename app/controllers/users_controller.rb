class UsersController < ApplicationController
  before_action :user_logged_in, only: [:edit, :update, :index]
  before_action :correct_user,   only: [:edit, :update]
  before_action :delete_rights,  only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Pivot!"
      Log_in(@user)
      redirect_to @user
    else
      render 'new' 
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile edited succesfully" 
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private 
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def user_logged_in
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def delete_rights 
      redirect_to(login_url) unless (current_user && current_user.admin?)
    end

end
