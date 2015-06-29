class CommentsController < ApplicationController

  def create
    @post = Post.take(category: params[:post][:category], id: params[:post][:id])
    @post.add_to_comments(params[:comment])
    redirect_to post_path(id: @post.id, category: @post.category)
  end

end
