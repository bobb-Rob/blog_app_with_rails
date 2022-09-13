# frozen_string_literal: true

# Rename users_id in Post table to author_id
class RenamePostsUserIdColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :users_id, :author_id
  end
end
