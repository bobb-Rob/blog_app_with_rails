# Add post counter column to users table
class AddPostsCounterToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :posts_counter, :integer
  end
end
