# frozen_string_literal: true

class FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followers = @user.followers.order(:id)
  end
end