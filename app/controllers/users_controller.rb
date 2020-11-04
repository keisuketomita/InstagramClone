class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :logged_in?, only: [:show, :edit]
  before_action :authenticate_user, only: [:show, :edit]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params_new)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
  end
  def update
    if @user.update(user_params_edit)
      redirect_to user_path(@user.id), notice: "ユーザーを編集しました"
    else
      render :edit
    end
  end
  private
  def user_params_new
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def user_params_edit
    params.require(:user).permit(:name, :email, :image)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
