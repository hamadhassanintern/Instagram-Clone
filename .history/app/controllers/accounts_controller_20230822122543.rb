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
    same_user = @signed_in_account== @account

    if same_user || !@account.private?
      # If the signed-in user's account is the same as the account being viewed
      # OR the profile is public, show both public and private posts
      @linked_posts = @account.posts
      @show_picture = true
    else
      # If the profile is private and the signed-in user's account is not the same,
      # only show private posts and hide the picture
      @linked_posts = @account.private_posts
      @show_picture = false
    end
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
