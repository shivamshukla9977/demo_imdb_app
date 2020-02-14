class CreateMovieCasts < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_casts do |t|
      t.references :person, null: false, foreign_key: true
      t.references :movies, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
