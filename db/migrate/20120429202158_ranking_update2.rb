class RankingUpdate2 < ActiveRecord::Migration
  def change

  	add_column :rankings, :suggestion_id, :integer

  	add_column :rankings, :guest_id, :integer
  end

  def down
  end
end
