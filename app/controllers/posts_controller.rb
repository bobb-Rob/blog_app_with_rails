class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post_by_id = Post.find_by(id: params['id'])
  end
end