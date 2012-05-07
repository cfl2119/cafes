class Updateadmin < ActiveRecord::Migration
  def change
  	create_table :rankings, :value => :integer
  	change_column :users, :admin, :boolean, :default => false


  end

  def down
  end
end
