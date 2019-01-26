class PostsController < ApplicationController
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      redirect_to root_path
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
end
