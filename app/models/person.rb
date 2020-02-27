class Person < ApplicationRecord
	has_many :movie, through: :movie_cast
end