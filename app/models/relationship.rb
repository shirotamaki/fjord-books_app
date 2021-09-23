class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
end

# => ["id", "follower_id", "followed_id", "created_at", "updated_at"]