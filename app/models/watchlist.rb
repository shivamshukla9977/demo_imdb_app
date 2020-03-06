class Watchlist < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  scope :user_watchlist, -> (user) { where('user_id = ?', user.id) }

end
