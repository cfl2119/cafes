class InvitationsUpdate < ActiveRecord::Migration
  def change

  	remove_column :invitations, :user_name
  	add_column :invitations, :user_id, :integer
  	remove_column :invitations, :event_name
  	add_column :invitations, :event_id, :integer

  end

  def down
  end
end
