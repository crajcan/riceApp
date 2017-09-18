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
     #if request_location == "home"
     #  @feed_items = @user.feed.paginate(page: params[:page])
     #  redirect_to "/home"
     #else
     #  @posts = @user.posts.paginate(page: params[:page])
     #  redirect_to @user
     #end  
   end
    redirect_to request.referrer || root_url
  end

  def destroy
    @reply.destroy
    flash[:success] = "Reply removed"
    redirect_to request.referrer || root_url
  end

  private
  
    def reply_params
      params.require(:reply).permit(:content)# , :picture)
    end

    def delete_rights
      @reply = current_user.replies.find_by(id: params[:id])
      redirect_to request.referrer || root_url unless !@reply.nil? && (current_user.admin? || (current_user == @reply.user))
    end  
end
