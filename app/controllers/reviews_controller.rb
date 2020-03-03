class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end
  
  def create
    @review = Review.create(review_params)
    p @review
    if @review.save
      redirect_to movie_reviews_path(@review)
    else
      render :new
    end  
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :movie_id, :comment)
  end
end
