class MoviesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @movies = Movie.all
  end

	def new
		@movie = Movie.new
    1.times { @movie.movie_casts.build }
    1.times { @movie.movie_genres.build }
	end

	def create
		@movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end  
	end

	def show
    @movie = Movie.find(params[:id])
  end

	def edit
  	@movie = Movie.find(params[:id])
	end

  def search
    if params[:search].blank?  
      redirect_to root_path
    else
      @movies = Movie.search(params[:filter].downcase, params[:search].downcase)
      render :index
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
      movie_casts_attributes: [:person_id, :role_id],
      movie_genres_attributes: [:genre_id])
  end
end