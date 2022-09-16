class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def five_recent_comments
    comments.order('created_at desc').limits(5)
  end
end
