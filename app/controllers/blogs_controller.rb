class BlogsController < ApplicationController
  def index
    @blogs = Blog.active.order(:created_at).reverse
  end

  def show
    @blog = Blog.friendly.find(params[:id])
    @recent_blogs = Blog.last(5)
  end
end
