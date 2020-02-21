class Movie < ApplicationRecord
	has_many :movie_cast
	has_many :review
	has_and_belongs_to_many :genre
end
