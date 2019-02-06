class UsersController < ApplicationController
  def followers
    @user = User.find_by_username(params[:id])
    @followers = @user.followers
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def following
    @user = User.find_by_username(params[:id])
    @following = @user.following
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
