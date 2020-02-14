class MovieCast < ApplicationRecord
  belongs_to :person
  belongs_to :movies
  belongs_to :role

  has_many :person
  has_many :movies
  has_one :role
end
