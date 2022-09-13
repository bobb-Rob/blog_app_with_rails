# frozen_string_literal: true

# Create Likes table
class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, &:timestamps
  end
end
