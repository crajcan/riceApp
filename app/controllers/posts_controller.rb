class PostsController < ApplicationController
  before_action :user_logged_in, only: [:create, :destroy] 
  before_action :delete_rights,  only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    @post.event = true unless @post.event_location.empty? || @post.event_time.nil?
    if @post.save
      @post.event? ? flash[:success] = "Event posted!" 
                   : flash[:success] = "Post created!"
      redirect_to '/home'        
    else
      flash[:danger] = "Invalid post"
      respond_to do |format|
        format.html { redirect_to '/home' }
        format.js
      end
    end
  end

  def destroy 
    @post.destroy
    flash[:success] = "Post removed"
    redirect_to request.referrer || root_url
  end
 
  private
  
    def post_params
      params.require(:post).permit( :title,
                                    :content, 
                                    :picture,
                                    :event_time,
                                    :event_location)
    end

    def delete_rights
      @post = Post.find_by(id: params[:id])
      redirect_to root_url unless !@post.nil? && (current_user.admin? || (current_user == @post.user))
    end

end
