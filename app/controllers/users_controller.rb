class UsersController < ApplicationController

  def index
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
    @user.password_required = false
    if @user.update_attributes(user_params)
      flash[:success] = "Profile edited succesfully" 
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
  end

  private 
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
