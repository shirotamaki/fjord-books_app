# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:email).page(params[:page]).per(2)
  end

  def show
    @user = current_user
  end
end
