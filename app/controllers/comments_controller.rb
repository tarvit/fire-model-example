class CommentsController < ApplicationController


  def create
    @post = Post.take(category: params[:post][:category], id: params[:post][:id])
    @post.add_to_comments(params[:comment])
    render 'posts/show'

  end

end
