class PostsController < ApplicationController
  before_filter :init_category
  before_filter :init_post, only: :show

  def index
    @posts = Post.all
  end

  def show; end

  def create
    @post = Post.create(params[:post])
    render :show
  end

  private

  def init_category
    @category = params[:category] || 'Default'
  end

  def init_post
    @post = Post.take(category: @category, id: params[:id])
  end

end
