class CreateInvitations < ActiveRecord::Migration
  def change
	drop_table :invitation
  	add_column :invitations, :user_name, :string
  	add_column :invitations, :event_name, :string 

  end
end
