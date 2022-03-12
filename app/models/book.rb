# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  include Commentable
  validates :title, :memo, presence: true
end
