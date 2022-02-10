class Report < ApplicationRecord
  belongs_to :user
  include Commentable
  validates :title, :content, presence: true
end
