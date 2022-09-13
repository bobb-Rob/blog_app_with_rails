# frozen_string_literal: true

# Add users_id as foreign key to Comments
class AddUsersRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :users, null: false, foreign_key: true
  end
end
