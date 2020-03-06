class Person < ApplicationRecord
	has_many :movies
  has_one_attached :image
end