class PostsController < ApplicationController
  expose(:developer) { current_developer }
  expose(:post, attributes: :post_params)
  expose(:posts) { developer.posts }

  def create
    if post.save
      redirect_to root_path
    else
      flash[:alert] = post.errors.full_messages
      render :new
    end
  end

  def index
    self.posts = Post.order created_at: :desc
  end

  private

  def post_params
    params.require(:post).permit :body
  end
end
