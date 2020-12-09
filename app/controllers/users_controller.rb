class UsersController < ApplicationController

  def index
    @users = User.all
    @id = current_user.id
    @user = User.find(@id)
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @id = current_user.id
    @books = Book.where(user_id: @id)
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    @user.profile_image_id = current_user.id
    @user.save
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id)
    else
     render ("edit")
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
