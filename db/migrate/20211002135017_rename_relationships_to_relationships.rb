class RenameRelationshipsToRelationships < ActiveRecord::Migration[6.1]
  def change
    remove_index :relationships, :follower_id
    remove_index :relationships, :followed_id
  end
end
