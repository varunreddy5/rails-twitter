class PagesController < ApplicationController
  def index
  end

  def home

    @posts = Post.where(user_id: [current_user.id, current_user.following.pluck(:id)].flatten).order("created_at desc")
    @newPost = Post.new
    @user = User.find_by_username(params[:id])
    @users = User.all

  end



  def profile
    @user = User.find_by_username(params[:id])
    if User.find_by_username(params[:id])
      @username = params[:id]
    else
      redirect_to root_path, notice: "User not Found."
    end

    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id])).order("created_at desc")
    @newPost = Post.new
  end

  def explore
    @posts = Post.all
  end
end
