class FollowedUsersController < ApplicationController
  # def index
  #   user = User.find(params[:user_id])
  #   @followed_users = user.followed_users
  # end

  def new
    @followed_users = Relationship.new
  end

  # ログインしているユーザーが、フォローボタンを押すと、フォローしている人に追加する。
  # フォローボタンを押されたユーザーは、フォロワーに追加する。
  def update
    # 例：ログインしているユーザーが、フォローしているユーザーの一覧を変数に代入する
    # @followed_users = current_user.followed_users
    # 現在見ている(開いている)詳細ページのユーザーをuser変数へ代入する。
    # user = User.find(params[:user_id])
    # データベースへ、userを追加する
    @followed_users = User.find(params[:user_id])
    # Relationship.create!(
    # follower_id: current_user.id,
    # followed_id: user.id
    # )
    # 処理が終わったらリダイレクトする
    redirect_to "users"
  end
end

