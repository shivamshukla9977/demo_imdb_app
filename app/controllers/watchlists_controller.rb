class WatchlistsController < ApplicationController
  def index
    @watchlists = Watchlist.all
  end

  def new
    @watchlist = Watchlist.new
  end

  def create
    @watchlist = Watchlist.new(watchlist_params)
    
    if @watchlist.save
      redirect_to watchlist_path
    end  
  end

  def show
    @watchlist = Watchlist.find(params[:id])
    @result = @watchlist.movie
    #render json: @watchlist
  end

  private

  def watchlist_params
    params.require(:watchlist).permit(:movie_id, :user_id)
  end
end

