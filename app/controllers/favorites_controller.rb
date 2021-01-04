class FavoritesController < ApplicationController

  def create
    @path = Rails.application.routes.recognize_path(request.referer)
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    case params[:order_sort]
    when "0"
      redirect_to book_path(book)
    when "1"
      redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    case params[:order_sort]
    when "0"
      redirect_to book_path(book)
    when "1"
      redirect_to books_path
    end
  end
end
