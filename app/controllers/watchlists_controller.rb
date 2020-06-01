class WatchlistsController < ApplicationController
  def index
    @watchlists = current_user.watchlists.order(id: :desc).first(10)
  end

  def new
    @watchlist = Watchlist.new
  end

  def create
    @watchlist = Watchlist.new(watchlist_params)
    p @watchlist
    if @watchlist.save
      #redirect_to root_path
    else
      p @watchlist.errors
      redirect_to root_path
    end
  end

  def next
    @watchlists = current_user.watchlists.next(params[:id])
    render :index
  end

  def previous
    @watchlists = current_user.watchlists.previous(params[:id])
    render :index
  end

  def show
    @watchlist = Watchlist.find(params[:id])
  end

  private

  def watchlist_params
    params.require(:watchlist).permit(:movie_id, :user_id)
  end
end

