class AddSuggestionTable < ActiveRecord::Migration
  def change
    create_table :suggestions
  end

  def down
  end
end
