class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      redirect_to "/home"
    end
  end



  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
