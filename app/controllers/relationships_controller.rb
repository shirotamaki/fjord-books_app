class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_to user_path(user)
  end
  def destroy
    current_user.unfollow(params[:id])
    redirect_to user_path(params[:id])
  end

  # フォロー一覧
  def following
    user = User.find(params[:id])
    @user = user.following
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
