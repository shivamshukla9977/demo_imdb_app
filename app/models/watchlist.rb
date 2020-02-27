class Watchlist < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  def movie
    Watchlist.includes(:movie, :user)
    #Movie.includes(:watchlist)
  end

end
