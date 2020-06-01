class Watchlist < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  scope :user_watchlist, -> (user) { where('user_id = ?', user.id) }

  scope :next, ->(id) { where("id < ?", id).order(id: :desc).first(10) }
  scope :previous, ->(id) { where("id > ?", id).order(id: :desc).last(10) }
end
