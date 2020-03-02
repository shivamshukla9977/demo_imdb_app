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

  def forgot
    if params[:email].blank? # check if email is present
      return render json: {error: "Email not present’"}
    end

    user = User.find_by(email: params[:email]) # if present find user by email

    if user.present?
      user.generate_password_token! #generate pass token
      # SEND EMAIL HERE
      render json: {status: "ok"}, status: :ok
    else
      render json: {error: ["Email address not found. Please check and try again."]}, status: :not_found
    end
  end

  def reset
    token = params[:token].to_s

    if params[:email].blank?
      return render json: {error: "Token not present"}
    end

    user = User.find_by(reset_password_token: token)

    if user.present? && user.password_token_valid?
      if user.reset_password!(params[:password])
        render json: {status: "ok"}, status: :ok
      else
        render json: {error: user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error:  ["Link not valid or expired. Try generating a new link."]}, status: :not_found
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date, :play_time, :language, :country, :description, :image, 
      movie_casts_attributes: [:person_id, :role_id],
      movie_genres_attributes: [:genre_id])
  end
end