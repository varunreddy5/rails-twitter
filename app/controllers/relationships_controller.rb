class RelationshipsController < ApplicationController
  def create
    @user = User.find_by_username(params[:followed_id])
    current_user.follow(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
  end
end
