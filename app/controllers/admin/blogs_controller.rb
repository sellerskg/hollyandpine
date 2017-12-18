module Admin
  class BlogsController < AdminController
    before_filter :set_blog, only: [:show, :destroy, :edit, :update]

    def index
      @blogs = Blog.all
    end

    def new
      @blog = Blog.new
    end

    def create
      @blog = Blog.new(blog_params)

      if @blog.save
        redirect_to admin_blogs_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @blog.update_attributes(blog_params)
        redirect_to admin_blogs_path
      else
        render :edit
      end
    end

    def destroy
      @blog.destroy
      redirect_to admin_blogs_path
    end

    private
    def blog_attributes
      [
        :title, 
        :subtitle, 
        :cover_image, 
        :main_image, 
        :body,
        :active
      ]
    end

    def blog_params
      params.require(:blog).permit(blog_attributes)
    end

    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end
  end
end
