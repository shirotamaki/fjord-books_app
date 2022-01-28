# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  # 能動的：フォローする
  has_many :active_friendships, class_name: "Friendship", foreign_key: "follower_id", dependent: :destroy
  # 特定のユーザーがフォローしているユーザーを取得できるメソッド
  # @user.active_friendships.map(&:followed) =>（ @userがフォローしているユーザーをmapで取得）
  has_many :following, through: :active_friendships, source: :followed

  # 受動的：フォローされる
  has_many :passive_friendships, class_name: "Friendship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_friendships, source: :follower

  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_friendships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしていたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
end
