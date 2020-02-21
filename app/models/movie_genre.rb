class MovieGenre < ApplicationRecord
  belongs_to :movies
  belongs_to :genre

end
