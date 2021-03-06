class RelationshipsController < ApplicationController

  def create
    @user = User.find_by_username(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to user_profile_path(@user.id) }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to user_profile_path(@user.id) }
      format.js
    end
  end
end
