class PostsController < ApplicationController
  before_filter :init_category

  def index
    @posts = Post.query(category: @category)
  end

  def show
    @post = Post.take(category: @category, id: params[:id])
  end

  private

  def init_category
    @category = params[:category] || 'Default'
  end

end
