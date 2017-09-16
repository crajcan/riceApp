class RelationshipsController < ApplicationController
  before_action :user_logged_in
 
  def create
    @user = User.find(params[:unfollowed_id])
    current_user.unfollow(@user)
    flash[:success] = "You have unfollowed #{@user.name}"
    redirect_to unfollowing_user_path(current_user) 
    #respond_to do |format|
    #  format.html { redirect_to @user }
    #  format.js
    #end
  end
 
  def destroy
    @user = Relationship.find(params[:id]).unfollowed
    current_user.follow(@user)
    flash[:success] = "You are now following #{@user.name} again"
    redirect_to @user
    #respond_to do |format|
    #  format.html { redirect_to @user }
    #  format.js
    #end   
  end

end
