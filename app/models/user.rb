# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :active_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy, inverse_of: 'follower'
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :followed_id, dependent: :destroy, inverse_of: 'followed'
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user_id)
    active_relationships.create(followed_id: other_user_id)
  end

  def unfollow(other_user_id)
    active_relationships.find_by(followed_id: other_user_id).destroy
  end

  def following?(other_user_id)
    following.include?(other_user_id)
  end
end
