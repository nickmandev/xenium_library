class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to "/books/#{params[:book_id]}"
  end

  def show
    @review = Review.where(:user_id => params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:text,:rating,:book_id)
  end
end
