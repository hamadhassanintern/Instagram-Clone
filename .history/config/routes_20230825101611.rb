# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  # dashboard
  get '/dashboard', to: 'accounts#index'
  get 'follower_suggestions', to: 'accounts#follower_suggestions'
  resources :accounts do
    member do
      post 'like_user_post/:post_id', to: 'accounts#like_user_post', as: :like_user_post
      delete 'unlike_user_post/:post_id', to: 'accounts#unlike_user_post', as: :unlike_user_post
    end
  end
  resources :posts
  resources :comments
  resources :public, only: [:homepage]
  devise_scope :account do
    root to: 'devise/sessions#new'
  end
  resources :stories
  resources :followers

  get 'search/index'

  resources :profile, only: [:index]
  get 'profile/:id', to: 'profile#show', as: :profile
  post 'profile/follow', to: 'profile#follow'
  delete 'profile/unfollow', to: 'profile#unfollow'
  post 'profile/accept_follow_request', to: 'profile#accept_follow_request'
end
