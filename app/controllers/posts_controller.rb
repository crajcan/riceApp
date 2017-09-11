class PostsController < ApplicationController
  before_action :user_logged_in, only: [:create, :destroy] 

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    flash[:danger] = "Post cannot be empty"
    redirect_to root_url
  end

  def destroy
  end
 
  private
  
    def post_params
      params.require(:post).permit(:content)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

end
