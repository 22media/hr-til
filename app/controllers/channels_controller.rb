class ChannelsController < ApplicationController
  def show
    @channel = Channel.find_by_name! params[:id]
    @posts = @channel.posts.published.order created_at: :desc
  end
end
