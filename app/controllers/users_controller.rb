# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:email).page(params[:page]).per(2)
  end
  def show
    @user = if request.path == '/users/show'
              current_user
            else
              User.find(params[:id])
            end
  end
end
