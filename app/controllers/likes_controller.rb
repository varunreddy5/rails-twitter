class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @post.likes.where(user_id: current_user.id).first_or_create
    redirect_to root_path
  end

  def destroy
    @post.likes.where(user_id: current_user.id).destroy_all
    redirect_to root_path
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
