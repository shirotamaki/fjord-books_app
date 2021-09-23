class FollowerUsersController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @follower_users = user.follower_users
  end
end
