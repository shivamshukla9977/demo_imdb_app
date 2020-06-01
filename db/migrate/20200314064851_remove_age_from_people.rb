class RemoveAgeFromPeople < ActiveRecord::Migration[6.0]
  def change
  	remove_column :people, :age, :integer
  	add_column :people, :dob, :date
  end
end
