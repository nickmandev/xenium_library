class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book.new(book_params)
    @book.save
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @reviews = Review.where(:book_id => params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title,:description,:isbn, picture_attributes: [:picture])
  end
end
