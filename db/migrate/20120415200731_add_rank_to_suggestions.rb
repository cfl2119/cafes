class AddRankToSuggestions < ActiveRecord::Migration
  def change
  	  add_column :suggestions, :rank, :integer
  end
end
