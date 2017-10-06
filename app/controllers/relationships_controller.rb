class RelationshipsController < ApplicationController
  before_action :user_logged_in
 
  def create
    Rails.logger.info "hit create/unfollow"
    @user = User.find(params[:unfollowed_id])
    current_user.unfollow(@user)
    @relationship = current_user.active_relationships.find_by(unfollowed_id: @user.id)
    flash[:success] = "You have unfollowed #{@user.name}"
    respond_to do |format|
      format.html { redirect_to unfollowing_user_path(current_user) }
      format.js
    end
  end
 
  def destroy
    Rails.logger.info "hit destroy/refollow"
    @user = Relationship.find(params[:id]).unfollowed
    @relationship_id = params[:id]
    current_user.follow(@user)
    flash[:success] = "You are now following #{@user.name} again"
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end   
  end

end
