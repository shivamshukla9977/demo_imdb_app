class SearchesController < ApplicationController
  def index
    @movie = Movie.all
  end

  def search  
    if params[:search].blank?  
      redirect_to root_path
    else
      @movies = params[:search].downcase  
      @movies = Movie.all.where("lower(title) LIKE :search", search: @movies)
      redirect_to search_path(@movies) 
      #render json: @movies
    end
  end
end
