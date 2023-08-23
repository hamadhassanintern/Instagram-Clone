# frozen_string_literal: true

# This is the controller responsible for managing user accounts.
class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]

  def index
    @comment = Comment.new
    following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id
    @posts = Post.where(account_id: following_ids, private: false)
    @follower_suggestions = Account.where.not(id: following_ids)
  end

  def profile
    @linked_posts = @account.posts
    if account_signed_in? && current_user == @account.user

    end
    # Check if the account is public
    if @account.private?
      @show_picture = false
    else
      @show_picture = true
    end
    # user profile
  end

  def follow_account
    follower_id = current_account.id
    following_id = params[:follow_id]
    if Follower.create!(follower_id:, following_id:)
      flash[:success] = 'Now Following user'
    else
      flash[:danger] = 'Unable to add follower user'
    end
    redirect_to dashboard_path
  end


  private

  def set_account
    @account = Account.find_by_username(params[:username])
  end
end
