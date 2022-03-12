# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  include Commentable
  validates :title, :content, presence: true
end
