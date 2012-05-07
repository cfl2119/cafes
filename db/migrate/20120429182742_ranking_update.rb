class RankingUpdate < ActiveRecord::Migration
  def change
  	add_column :rankings, :value, :integer

  end

  def down
  end
end
