class AddImageToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movie, :image, :string
    add_column :movie, :language, :string
    add_column :movie, :country, :string
  end
end
