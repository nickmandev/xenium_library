class BooksController < ApplicationController

  skip_before_action :verify_authenticity_token, :only => [:search]

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

  def search
    @books = Book.all
    @results = []
    search = params[:name].to_s.downcase
    @books.each do |book|
      if book.title.downcase.include?(search)
        @results.push(book)
      end
    end
    @data = @results.to_json
    @data
  end

  private
  def book_params
    params.require(:book).permit(:name, :title,:description,:isbn, picture_attributes: [:picture])
  end
end
