class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movies

  has_many :user
end
