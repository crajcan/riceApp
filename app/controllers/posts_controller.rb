class PostsController < ApplicationController
  before_action :user_logged_in, only: [:create, :destroy] 
  before_action :delete_rights,  only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      flash[:danger] = "Post cannot be empty"
    end
    redirect_to '/home'
  end

  def destroy 
    @post.destroy
    flash[:success] = "Post removed"
    redirect_to request.referrer || root_url
  end
 
  private
  
    def post_params
      params.require(:post).permit(:content, :picture)
    end

    def delete_rights
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil? || !current_user.admin?
    end

end
