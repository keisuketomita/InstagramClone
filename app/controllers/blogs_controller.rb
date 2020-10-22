class BlogsController < ApplicationController
  def index
  end
  def new
    @blog = Blog.new
  end
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end
  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice:"ブログを投稿しました"
      else
        render :new
      end
    end
  end
  def edit
  end
  def update
  end
  def destroy
  end
  private
  def blog_params
    params.require(:blog).permit(:content, :image, :image_cache)
  end
  def set_blog
  end
end
