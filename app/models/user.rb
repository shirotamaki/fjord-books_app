# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :followed_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followed_users, through: :followed_relationships, source: :followed
  has_many :follower_relationships, class_name: 'Relationship', foreign_key: :followed_id
  has_many :follower_users, through: :follower_relationships, source: :follower
end
