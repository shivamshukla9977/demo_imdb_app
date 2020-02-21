class Movie < ApplicationRecord
	has_many :movie_cast
	has_many :review
	has_many :genre
end
