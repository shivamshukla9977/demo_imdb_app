class MoviesController < ApplicationController
  
  # def index
  #   @movie = Movies.all  
  # end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.create(movie_params)
    redirect_to movie_path(@movie)
	end

	# def show
 #    #@movie = Movie.find(params[:id])
 #    redirect_to 'view_movie'
 #  end

	def edit
  	#@movie = Movies.find(params[:id])
	end

  def view_movie
    
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :release_date, :play_time, :description)
  end
end
