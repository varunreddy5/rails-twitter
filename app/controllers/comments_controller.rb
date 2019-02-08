class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create

    @comment = @commentable.comments.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.user_id = current_user
    @comment.save
    redirect_to @commentable
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
