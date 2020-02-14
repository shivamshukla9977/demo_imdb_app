class MovieGenre < ApplicationRecord
  belongs_to :movie
  belongs_to :genre

  has_may :genre
end
