class AccessCodesController < ApplicationController
  before_action :user_logged_in
  before_action :user_admin

  def new
    @access_code = AccessCode.new
  end

  def create
   @access_code = AccessCode.new(access_code_params)
   if @access_code.save
      flash[:success] = "New access code \"#{access_code_params[:code]}\" created!"
    end
    redirect_to '/access_codes'
  end

  def destroy
    @access_code = AccessCode.find_by(id: params[:id])
    @access_code.destroy
    flash[:success] = "Code removed."
    redirect_to '/access_codes' 
  end

  private
  
    def access_code_params
      params.require(:access_code).permit(:code)
    end

    def user_admin
      redirect_to root_url unless current_user.admin?
    end   

end
