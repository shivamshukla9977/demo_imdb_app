class Movie < ApplicationRecord
	has_many :movie_casts
	has_many :reviews
	has_many :movie_genres
  has_many :watchlists
  has_one_attached :image
  accepts_nested_attributes_for :movie_casts, :movie_genres, allow_destroy: true, reject_if: :all_blank

  validates :title, length: { minimum: 2 }


  def added_to_watchlist?(user)
    watchlists.user_watchlist(user).any?
  end  

  def self.search(filter, search)
    if filter == 'actor'
      Movie.includes(movie_casts: :person).where("people.name LIKE ?","#{search}%").references(:movie_casts, :people)
    elsif filter == 'genre'
      Movie.includes(movie_genres: :genre).where("genres.title LIKE ?","#{search}%").references(:movie_genres, :genres)
    elsif filter == 'movies'
      where("LOWER(title) LIKE ?","#{search}%")
    end
  end
end