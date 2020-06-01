class MovieGenre < ApplicationRecord
  belongs_to :movie
  belongs_to :genre
  scope :unique, -> {select(:genre_id).distinct}
end
