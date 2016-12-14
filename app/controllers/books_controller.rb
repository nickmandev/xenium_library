class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book.new(book_params)
    @book.save
  end

  def list
    @books = Book.all
  end

  private
  def book_params
    params.require(:book).permit(:title,:description,:isbn, picture_attributes: [:picture])
  end
end
