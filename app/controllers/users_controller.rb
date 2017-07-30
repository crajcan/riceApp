class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      @user.errors.details.each do |error|
        Rails.logger.info "ERRROR = #{error}"
      end
    end
  end

  private 
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
