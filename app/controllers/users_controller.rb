class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @users = User.all.order(id: "ASC")
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
    @book = Book.new

    # DM用
    if user_signed_in?
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id
              @haveRoom = true
              @roomId = cu.room_id
            end
          end
        end
        unless @haveRoom
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    @user.profile_image_id = @current_user.id
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
     render :edit
    end
  end

  def ensure_correct_user
    @user = User.find_by(id:params[:id])
    if @user.id != current_user.id
      redirect_to("/users/#{current_user.id}")
    end
  end

  def following_user
    @user = User.find(params[:id])
  end

  def follower_user
    @user = User.find(params[:id])
  end

  def search
  @user_or_post = params[:option]
    if @user_or_post == "1"
      @users = User.search(params[:search], @user_or_post, @how_search)
    else
      @books = Book.search(params[:search], @user_or_post, @how_search)
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end