class MoviesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @movies = Movie.all
  end

	def new
		@movie = Movie.new
    @movie.movie_casts.build
    @movie.movie_genres.build 
	end

	def create
		@movie = Movie.new(movie_params)
    if @movie.save
      #redirect_to movies_path
    else
      render :new
    end  
	end

	def show
    @movie = Movie.find(params[:id])
    @movies = Movie.all
  end

	def edit
  	@movie = Movie.find(params[:id])
	end

  def search
    if params[:search].blank?  
      redirect_to root_path
    else
      @movies = Movie.search(params[:filter].downcase, params[:search])
      respond_to do |format|
        format.html
        format.js
      end  
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date, :play_time, :language, :country, :description, :image, 
      movie_casts_attributes: [:id, :person_id, :role_id],
      movie_genres_attributes: [:id, :genre_id])
  end
end