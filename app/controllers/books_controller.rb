class BooksController < ApplicationController

  skip_before_action :verify_authenticity_token, :only => [:search]
  before_filter :set_page, :only => [:index]

  RESULTS_PER_PAGE = 20
  COMMENTS_LIMIT = 3

  def new
    @book = Book.new
  end

  def create
    @book.new(book_params)
    @book.save
  end

  def index
    @books = Book.all.limit(RESULTS_PER_PAGE).offset(@page.to_i * RESULTS_PER_PAGE.to_i)
  end

  def show
    @book = Book.find(params[:id])
    @reviews = Review.where(:book_id => params[:id]).limit(COMMENTS_LIMIT).order("created_at DESC")
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
    params.require(:book).permit(:page, :name, :title,:description,:isbn, picture_attributes: [:picture])
  end

  def set_page
    @page = params[:page] || 0
  end
end
