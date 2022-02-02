class Report < ApplicationRecord
  belongs_to :user
  include Commentable
end
