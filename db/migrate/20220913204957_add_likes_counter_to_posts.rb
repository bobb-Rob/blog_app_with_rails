# Add likes counter column to post table
class AddLikesCounterToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :likes_counter, :integer
  end
end

