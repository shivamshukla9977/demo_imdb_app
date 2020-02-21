class RenameMyTable < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :people, :person
  end

  def self.down
    rename_table :person, :people
  end
end
