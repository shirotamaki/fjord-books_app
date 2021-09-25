# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(params[:followed_id])
    redirect_to user_path(user)
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to user_path(params[:id])
  end
end
