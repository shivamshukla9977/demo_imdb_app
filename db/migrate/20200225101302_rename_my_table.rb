class RenameMyTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :movie, :movies
  end
end