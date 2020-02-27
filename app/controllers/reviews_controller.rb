class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.create(review_params)
    render json: @review
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :movie_id, :comment)
  end
end
