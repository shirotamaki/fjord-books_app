# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  # 能動的：フォローする
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 特定のユーザーがフォローしているユーザーを取得できるメソッド
  # @user.active_relationships.map(&:followed) =>（ @userがフォローしているユーザーをmapで取得）
  has_many :following, through: :active_relationships, source: :followed

  # 受動的：フォローされる
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
end
