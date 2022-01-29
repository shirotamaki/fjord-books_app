# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  # フォロー一覧
  # GET /users/:id/following
  def following
    @user = User.find(params[:id])
    @users = @user.following.order(:id)
    render 'show_follow'
  end

  # フォロワー一覧
  # GET /users/:id/followers
  def followers
    @user = User.find(params[:id])
    @users = @user.followers.order(:id)
    render 'show_follow'
  end
end
