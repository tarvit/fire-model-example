class PostsController < ApplicationController
  before_filter :init_category, only: [ :index, :show ]

  def index
    if params[:category]
      @posts = Post.query(category: @category)
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.take(category: @category, id: params[:id])
  end

  def create
    @post = Post.create(params[:post])
    render :show
  end

  private

  def init_category
    @category = params[:category] || Post::CATEGORIES.first
  end

end
