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
    @post = Post.take(category: (@category || Post::CATEGORIES.first), id: params[:id])
  end

  def create
    @category = params[:post][:category]
    @post = Post.create(params[:post])
    render :show
  end

  private

  def init_category
    @category = params[:category]
  end

end
