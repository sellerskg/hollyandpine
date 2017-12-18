class BlogsController < ApplicationController
  def index
    @blogs = Blog.all.reverse
  end

  def show
    @blog = Blog.friendly.find(params[:id])
    @recent_blogs = Blog.all.last(5)
  end
end
