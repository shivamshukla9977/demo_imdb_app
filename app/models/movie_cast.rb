class MovieCast < ApplicationRecord
  belongs_to :person
  belongs_to :movie
  belongs_to :role
end
