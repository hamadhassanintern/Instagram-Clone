class LikesController < ApplicationController
  before_action :authenticate_account!
  def create
    @like=current_user.likes.new(like_params)
    if !@like.save
      flash[:notice]=@like.errors.full_messages.to_sentence
    end
    red
  end
  private

  def like_params
    params.requre(:like).permit(:post_id)
  end
end
