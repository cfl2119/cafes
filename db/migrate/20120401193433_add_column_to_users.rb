class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :phone_number, :integer
    remove_column :caves, :drink_name
  end
end
