class AddImageToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :image, :string
    add_column :movies, :language, :string
    add_column :movies, :country, :string
  end
end
