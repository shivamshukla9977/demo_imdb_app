class Movie < ApplicationRecord
	has_many :movie_casts
	has_many :reviews
	has_many :movie_genres
  has_many :watchlists
  accepts_nested_attributes_for :movie_casts, :movie_genres

  def cast
    MovieCast.includes(:person, :movie)
  end

  def genre
    MovieGenre.includes(:genre, :movie)
  end

  def self.search(search)
    if search
      where("LOWER(title) LIKE ?","#{search}%")
    else
      all
    end
  end
end
