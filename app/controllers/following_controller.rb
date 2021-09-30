# frozen_string_literal: true

class FollowingController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @following = @user.following
  end
end
