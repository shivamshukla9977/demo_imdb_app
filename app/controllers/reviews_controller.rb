class ReviewsController < ApplicationController
  def new
    @review = Review.all  
  end

  def create
    @review = Review.new(params.require(:review).permit(:comment))
    @review.save
    render json: @review
  end


end
