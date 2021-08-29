class UsersController < ApplicationController
  def index
    @users = User.order(:email).page(params[:page]).per(2)
  end
end
