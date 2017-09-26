class StaticPagesController < ApplicationController
  before_action :user_logged_in, only: [:settings, :home]


  def home
    @post = current_user.posts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
    @reply = current_user.replies.build if @feed_items
    store_location
  end

  def help
  end

  def about
  end

  def settings
    @user = current_user
  end

end
