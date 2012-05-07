class ChangeCols < ActiveRecord::Migration
  def change
  	remove_column :suggestions, :user_name
  	remove_column :suggestions, :event_name

  	add_column :invitation, :user_name, :string
  	add_column :invitation, :event_name, :string

  end

  def down
  end
end
