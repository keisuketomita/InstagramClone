class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy, :show]
  before_action :logged_in?, only: [:index, :new, :edit, :show]
  before_action :authenticate_user, only: [:index, :new, :edit, :show]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    @favorite_count = Favorite.where(blog_id: @blog.id).count
  end
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
        redirect_to blogs_path, notice:"新規投稿しました"
        ContactMailer.contact_mail(@blog).deliver
      else
        render :new
      end
    end
  end
  def edit
  end
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "投稿を編集しました"
    else
      render :edit
    end
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "投稿を削除しました"
  end
  private
  def blog_params
    params.require(:blog).permit(:content, :image, :image_cache)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
  def ensure_correct_user
    if @blog.user_id != current_user.id
      redirect_to blogs_path, notice: "権限がありません"
    end
  end
end
