# frozen_string_literal: true

# Add users_id in Likes as foriegn key
class AddUsersRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :users, null: false, foreign_key: true
  end
end
