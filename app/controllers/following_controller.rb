# frozen_string_literal: true

class FollowingController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @follow = @user.following.order(:id)
  end
end
