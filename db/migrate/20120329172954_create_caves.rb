class CreateCaves < ActiveRecord::Migration
  def change
    create_table :caves do |t|
      t.string :name
      t.string :address
      t.string :drink_name

      t.timestamps
    end
  end
end
