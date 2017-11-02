class PinsController < ApplicationController
  before_action :user_logged_in
  before_action :delete_rights, only: :destroy  

  def create
    @user = current_user
    @post_id = params[:post_id]
    @pin = Pin.new(user_id: @user.id, post_id: @post_id)
    if @pin.save
      flash[:success] = "Post pinned"
      redirect_back_or(root_url)   
    end 
  end
 
  def destroy
    @pin.destroy
    flash[:success] = "Post unpinned"
    redirect_back_or(root_url)
  end

  private
   
    def delete_rights
      @pin = Pin.find params[:id]
      redirect_to request.referrer || root_url unless !@pin.nil? && (current_user.admin? || (current_user == @pin.user))
    end

end
