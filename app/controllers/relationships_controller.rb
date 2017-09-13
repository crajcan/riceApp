class RelationshipsController < ApplicationController
  before_action :logged_in_user
 
  def create
    user = User.find(params[:unfollowed_id])
    current_user.unfollow(user)
    flash[:success] = "You have unfollowed this user"
    redirect_to user
  end
 
  def destroy
    user = Relationship.find(params[:id]).unfollowed
    current_user.follow(user)
    flash[:success] = "You are now following this user again"
    redirect_to user
  end

end
