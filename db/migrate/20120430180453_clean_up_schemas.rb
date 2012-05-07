class CleanUpSchemas < ActiveRecord::Migration
  def change
  	remove_column :suggestions, :rank
  	remove_column :users, :phone_number
  	remove_column :events, :end
  	drop_table :homes

  end

  def down
  end
end
