class RepliesController < ApplicationController
  before_action :user_logged_in, only: [:create, :destroy]
  before_action :delete_rights, only: :destroy

  def create
   @user = current_user
   @reply = @user.replies.build(reply_params)
   if @reply.save
     flash[:success] = "Reply created"
   else
     flash[:danger] = "Reply cannot be empty."
   end
    redirect_back_or(root_url)
  end

  def destroy
    @reply.destroy
    flash[:success] = "Reply removed"
    redirect_back_or(root_url)
  end

  private

    def reply_params
      params.require(:reply).permit(:content, :post_id, :picture)
    end
  
    def delete_rights
      @reply = Reply.find params[:id]
      redirect_to request.referrer || root_url unless !@reply.nil? && (current_user.admin? || (current_user == @reply.user))
    end  
end
