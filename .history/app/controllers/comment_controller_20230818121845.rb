class CommentController < ApplicationController
  before_action :authenticate_account!

  def create
    @comment=Comment.new(comment_params)
    @comment.account.id=
  end

  private
  def comment_params
    params.require(:comment).permit(:comment,:post_id)
  end
end
