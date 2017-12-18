class BlogsController < ApplicationController
  def index
    @blogs = Blog.active.order(:created_at).reverse
    @blogs = Blog.where(active: true).paginate(page: params[:page], per_page: 9).order('created_at DESC')
  end

  def show
    @blog = Blog.friendly.find(params[:id])
    @recent_blogs = Blog.last(5)
  end
end
