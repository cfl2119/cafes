class InvitationUpdate < ActiveRecord::Migration
  def change
  	drop_table :rankings


  	add_column :users, :admin, :boolean

  end

  def down
  end
end
