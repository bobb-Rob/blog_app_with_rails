# frozen_string_literal: true

# Add users_id as reference to Posts table
class AddUsersRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :users, null: false, foreign_key: true
  end
end
