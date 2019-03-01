class PostsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to root_path}
        format.js
      end
    else
      redirect_to root_path
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end


      #   f.html { redirect_to: root_path, notice: "Post created successfully!" }
      # else
      #   f.html { redirect_to: root_path, notice: "Error: Post not saved" }
      # end

  private
  def post_params
    params.require(:post).permit(:content, :user_id)
  end

  def set_user
    @user = current_user
  end
end
