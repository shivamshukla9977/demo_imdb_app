class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.date :release_date
      t.time :play_time
      t.text :description

      t.timestamps
    end
  end
end
