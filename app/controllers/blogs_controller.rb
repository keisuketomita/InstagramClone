class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]
  before_action :logged_in?, only: [:index, :new, :edit]
  before_action :authenticate_user, only: [:index, :new, :edit]
  def index
    @blogs = Blog.all
  end
  def new
    @blog = Blog.new
  end
  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
  end
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
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
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました"
    else
      render :edit
    end
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path
  end
  private
  def blog_params
    params.require(:blog).permit(:content, :image, :image_cache)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
