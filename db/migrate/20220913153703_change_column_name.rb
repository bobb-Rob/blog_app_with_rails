# frozen_string_literal: true

# Change Column name users_id in Comments table to author_id
class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :users_id, :author_id
  end
end
