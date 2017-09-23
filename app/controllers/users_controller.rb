class UsersController < ApplicationController
  before_action :user_logged_in, only: [:edit, :update, :index, :show, :unfollowing]
  before_action :correct_user,   only: [:edit, :update, :unfollowing]
  before_action :delete_rights,  only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
    @posts = @user.profile_feed.paginate(page: params[:page])
    @reply = current_user.replies.build if @posts
    store_location
  end

  def new
    @user = User.new
  end

  def create
    access_code = user_params[:code]
    @user = User.new(user_params)
    if correct_code(access_code) && @user.save
      @user.send_activation_email
      flash[:success] = "Please check your email to activate your account"
      redirect_to root_url
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

  def settings
    @user = current_user
  end

  def unfollowing
    @users = @user.unfollowing.paginate(page: params[:page])
  end

  private 
  
    def user_params
      params.require(:user).permit(:name, 
                                   :email, 
                                   :password, 
                                   :password_confirmation,
                                   :code)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def delete_rights
      @user = User.find(params[:id])
      redirect_to(login_url) unless current_user && (current_user.admin? || current_user?(@user))
    end

    def correct_code(access_code)
      binding.pry
      if access_code && ((AccessCode.all.map { |c| c.code }).include? access_code)
        true
      else
        @user.errors.add(:activation_code, "is invalid")
        false
      end
    end

end
