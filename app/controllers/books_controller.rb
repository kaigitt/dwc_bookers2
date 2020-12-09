class BooksController < ApplicationController

  def index
    @books = Book.all.order(id: "ASC")
    @book = Book.new
    @id = current_user.id
    @user = User.find(@id)
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if  book.save
    redirect_to books_path
    else
    render ("index")
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @booknew = Book.new
    @id = current_user.id
    @usershow = User.find(@id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to books_path
    else
     render ("edit")
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    redirect_to books_path
    end
  end

  private
  def book_params
      params.require(:book).permit(:title, :body, :user_id)
  end
end
