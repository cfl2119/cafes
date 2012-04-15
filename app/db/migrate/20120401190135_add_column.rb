class AddColumn < ActiveRecord::Migration
  def change
    add_column :suggestions, :cafe_id, :integer
    add_column :suggestions, :event_id, :integer

    change_column :drinks, :price, :float
  end

  def down
  end
end
