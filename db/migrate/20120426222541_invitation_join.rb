class InvitationJoin < ActiveRecord::Migration
  def change
  	create_table :invitation
	add_column :suggestions, :user_name, :string
    add_column :suggestions, :event_name, :string
    

  end

  def down
  end
end
