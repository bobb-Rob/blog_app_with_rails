# frozen_string_literal: true

# Rename users_id in Likes table to author_id
class RenameColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :users_id, :author_id
  end
end
